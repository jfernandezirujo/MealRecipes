//
//  UseCasesDependencyHelper.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Foundation

class UseCasesDependencyHelper {
  
  // MARK: - Methods
  static func getMealsCategoryUseCase() -> GetMealsCategoryUseCaseProtocol {
    let getMealsCategoryRepository: GetMealsCategoryRepositoryProtocol = GetMealsCategoryRepository()
    return GetMealsCategoryUseCase(repository: getMealsCategoryRepository)
  }
  
  static func getMealsListUseCase() -> GetMealsListUseCaseProtocol {
    let getMealsListRepository: GetMealsListRepositoryProtocol = GetMealsListRepository()
    return GetMealsListUseCase(repository: getMealsListRepository)
  }
  
  static func getMealRecipeUseCase() -> GetMealRecipeUseCaseProtocol {
    let getMealRecipeRepository: GetMealRecipeRepositoryProtocol = GetMealRecipeRepository()
    return GetMealRecipeUseCase(repository: getMealRecipeRepository)
  }
  
  static func getImageSaver() -> ImageSaverUseCaseProtocol {
    let imageRepository: ImageSaverRepositoryProtocol = ImageSaverRepository()
    return ImageSaverUseCase(repository: imageRepository)
  }
}
