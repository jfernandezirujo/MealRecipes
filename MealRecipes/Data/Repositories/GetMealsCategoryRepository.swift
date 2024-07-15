//
//  GetMealsRepository.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Combine
import Foundation

// MARK: - protocol
protocol GetMealsCategoryRepositoryProtocol {
  func getMealsCategory() -> AnyPublisher<[MealCategoryDTO], MealRecipesDomainError>
}

// MARK: - GetMealsCategoryRepository
class GetMealsCategoryRepository: GetMealsCategoryRepositoryProtocol {
  
  // MARK: - Properties
  typealias constants = DataConstants
  
  // MARK: - Methods
  func getMealsCategory() -> AnyPublisher<[MealCategoryDTO], MealRecipesDomainError> {
    guard let url: URL = URL(string: constants.categoryURL) else {
      return Fail(error: MealRecipesDomainError.invalidURL)
        .eraseToAnyPublisher()
    }
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: CategoriesResponse.self,
              decoder: JSONDecoder())
      .map { $0.categories }
      .mapError { error in
        switch error {
        case is URLError:
          return MealRecipesDomainError.invalidURL
        case is DecodingError:
          return MealRecipesDomainError.decodingError
        default:
          return MealRecipesDomainError.generic
        }
        
      }
      .eraseToAnyPublisher()
  }
}
