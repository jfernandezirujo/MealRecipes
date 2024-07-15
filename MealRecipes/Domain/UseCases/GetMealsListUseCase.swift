//
//  GetMealsListUseCase.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Combine

// MARK: - protocol
protocol GetMealsListUseCaseProtocol {
  func execute(query: String) -> AnyPublisher<[MealSelectedCategoryDTO], MealRecipesDomainError>
}

// MARK: - GetPositionAPIClientUseCase
class GetMealsListUseCase: GetMealsListUseCaseProtocol {
  
  // MARK: - Properties
  private let repository: GetMealsListRepositoryProtocol
  
  // MARK: - init
  init(repository: GetMealsListRepositoryProtocol) {
    self.repository = repository
  }
  
  // MARK: - Methods
  func execute(query: String) -> AnyPublisher<[MealSelectedCategoryDTO], MealRecipesDomainError> {
    return repository.getMealsList(query: query)
  }
}
