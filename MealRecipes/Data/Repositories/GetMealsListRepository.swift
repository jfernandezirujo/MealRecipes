//
//  GetMealsListRepository.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Combine
import Foundation

// MARK: - protocol
protocol GetMealsListRepositoryProtocol {
  func getMealsList(query: String) -> AnyPublisher<[MealSelectedCategoryDTO], MealRecipesDomainError>
}

// MARK: - GetMealsListRepository
class GetMealsListRepository: GetMealsListRepositoryProtocol {
  
  // MARK: - Properties
  typealias constants = DataConstants
  
  // MARK: - Metrhods
  func getMealsList(query: String) -> AnyPublisher<[MealSelectedCategoryDTO], MealRecipesDomainError> {
    guard let url: URL = URL(string: constants.mealURL + query) else {
      return Fail(error: MealRecipesDomainError.invalidURL)
        .eraseToAnyPublisher()
    }
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: MealsResponse.self,
              decoder: JSONDecoder())
      .map { $0.meals }
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
