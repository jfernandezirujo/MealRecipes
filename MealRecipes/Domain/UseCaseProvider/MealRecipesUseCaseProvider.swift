//
//  MealRecipesUseCaseProvider.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Foundation

// MARK: - protocol
protocol MealRecipesUseCaseProviderProtocol {
  var getCategoriesUseCase: GetMealsCategoryUseCaseProtocol { get }
  var getListUseCase: GetMealsListUseCaseProtocol { get }
  var getRecipeUseCase: GetMealRecipeUseCaseProtocol { get }
  var imageSaverUseCase: ImageSaverUseCaseProtocol { get }
}

// MARK: - MealRecipesUseCaseProvider
final class MealRecipesUseCaseProvider: MealRecipesUseCaseProviderProtocol {
  
  // MARK: - Properties
  internal var getCategoriesUseCase: GetMealsCategoryUseCaseProtocol
  internal var getListUseCase: GetMealsListUseCaseProtocol
  internal var getRecipeUseCase: GetMealRecipeUseCaseProtocol
  internal var imageSaverUseCase: ImageSaverUseCaseProtocol
   
  // MARK: - init
  init(getCategoriesUseCase: GetMealsCategoryUseCaseProtocol,
       getListUseCase: GetMealsListUseCaseProtocol,
       getRecipeUseCase: GetMealRecipeUseCaseProtocol,
       imageSaverUseCase: ImageSaverUseCaseProtocol) {
    self.getCategoriesUseCase = getCategoriesUseCase
    self.getListUseCase = getListUseCase
    self.getRecipeUseCase = getRecipeUseCase
    self.imageSaverUseCase = imageSaverUseCase
  }

  // MARK: - lazy properties
  lazy var getListRepository: GetMealsListRepositoryProtocol = {
    return GetMealsListRepository()
  }()
  
  lazy var getRepcipesRepository: GetMealRecipeRepositoryProtocol = {
    return GetMealRecipeRepository()
  }()
  
  lazy var getCategoriesRepository: GetMealsCategoryRepositoryProtocol = {
    return GetMealsCategoryRepository()
  }()
  
  lazy var imageSaverRepository: ImageSaverRepositoryProtocol = {
    return ImageSaverRepository()
  }()
 
  // MARK: - Methods
  func provideGetCategoriesUseCaseUseCase() -> GetMealsCategoryUseCaseProtocol {
    return GetMealsCategoryUseCase(repository: getCategoriesRepository)
  }
  
  func provideGetListUseCaseUserUseCase() -> GetMealsListUseCaseProtocol {
    return GetMealsListUseCase(repository: getListRepository)
  }
  
  func provideGetRecipeUseCaseUseCase() -> GetMealRecipeUseCaseProtocol {
    return GetMealRecipeUseCase(repository: getRepcipesRepository)
  }
  
  func provideImageSaverUseCase() -> ImageSaverUseCaseProtocol {
    return ImageSaverUseCase(repository: imageSaverRepository)
  }
}
