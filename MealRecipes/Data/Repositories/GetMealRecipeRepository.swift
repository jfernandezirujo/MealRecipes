//
//  GetMealRecipeRepository.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Combine
import Foundation

// MARK: - protocol
protocol GetMealRecipeRepositoryProtocol {
  func getMealRecipe(query: String) -> AnyPublisher<[MealRecipeDTO], MealRecipesDomainError>
}

// MARK: - GetMealRecipeRepository
class GetMealRecipeRepository: GetMealRecipeRepositoryProtocol {
  
  // MARK: - Properties
  typealias constants = DataConstants
  
  // MARK: - Methods
  func getMealRecipe(query: String) -> AnyPublisher<[MealRecipeDTO], MealRecipesDomainError> {
    guard let url: URL = URL(string: constants.recipeURL + query) else {
      return Fail(error: MealRecipesDomainError.invalidURL)
        .eraseToAnyPublisher()
    }
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: RecipeResponse.self,
              decoder: JSONDecoder())
      .compactMap { $0.meals
        
      }
      .mapError { error in
        switch error {
        case is DecodingError:
          return MealRecipesDomainError.decodingError
        case is URLError:
          return MealRecipesDomainError.invalidURL
        default:
          return MealRecipesDomainError.generic
        }
      }
      .eraseToAnyPublisher()
  }
}
