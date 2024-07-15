//
//  GetMealsCategoryUseCase.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Combine

// MARK: - protocol
protocol GetMealsCategoryUseCaseProtocol {
  func execute() -> AnyPublisher<[MealCategoryDTO], MealRecipesDomainError>
}

// MARK: - GetPositionAPIClientUseCase
class GetMealsCategoryUseCase: GetMealsCategoryUseCaseProtocol {
  
  // MARK: - Properties
  private let repository: GetMealsCategoryRepositoryProtocol
  
  // MARK: - init
  init(repository: GetMealsCategoryRepositoryProtocol) {
    self.repository = repository
  }
  
  // MARK: - Methods
  func execute() -> AnyPublisher<[MealCategoryDTO], MealRecipesDomainError> {
    return repository.getMealsCategory()
  }
}
