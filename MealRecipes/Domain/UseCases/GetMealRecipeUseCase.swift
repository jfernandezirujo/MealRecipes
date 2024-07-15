//
//  GetMealRecipeUseCase.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Combine

// MARK: - protocol
protocol GetMealRecipeUseCaseProtocol {
  func execute(query: String) -> AnyPublisher<[MealRecipeDTO], MealRecipesDomainError>
}

// MARK: - GetPositionAPIClientUseCase
class GetMealRecipeUseCase: GetMealRecipeUseCaseProtocol {
  
  // MARK: - Properties
  private let repository: GetMealRecipeRepositoryProtocol
  
  // MARK: - init
  init(repository: GetMealRecipeRepositoryProtocol) {
    self.repository = repository
  }
  
  // MARK: - Methods
  func execute(query: String) -> AnyPublisher<[MealRecipeDTO], MealRecipesDomainError> {
    return repository.getMealRecipe(query: query)
  }
}
