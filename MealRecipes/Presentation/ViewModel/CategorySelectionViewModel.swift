//
//  CategorySelectionViewModel.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Combine
import SwiftUI
import UIKit

final class CategorySelectionViewModel: ObservableObject {
  
  // MARK: - Properties
  typealias constants = PresentationConstants
  private let useCaseProvider: MealRecipesUseCaseProviderProtocol
  @Published var categories: [MealCategoryDTO] = []
  @Published var meals: [MealSelectedCategoryDTO] = []
  @Published var meal: [MealRecipeDTO] = []
  @Published var selectedValues: MealSelectionsModel = MealSelectionsModel()
  @Published var ingredients: [String] = []
  @Published var measures: [String] = []
  @Published var showSheet: Bool = false
  @Published var isShowingCategories: Bool = true
  @Published var presentRecipe: Bool = false
  private var cancellables = Set<AnyCancellable>()

  // MARK: - init
  init(useCaseProvider: MealRecipesUseCaseProviderProtocol) {
    self.useCaseProvider = useCaseProvider
  }
  
  // MARK: - Methods
  func getMealCategories() {
    useCaseProvider.getCategoriesUseCase.execute()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { _ in },
            receiveValue: { categories in
        self.categories = categories.sorted(by: <)
      })
      .store(in: &cancellables)
  }
  
  func getMealsList() {
    useCaseProvider.getListUseCase.execute(query: selectedValues.strCategory)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { _ in },
            receiveValue: { meals in
        self.meals = meals.sorted(by: <)
      })
      .store(in: &cancellables)
  }
  
  func getMealRecipe() {
    useCaseProvider.getRecipeUseCase.execute(query: selectedValues.idMeal)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { _ in },
            receiveValue: { meals in
        self.meal = meals
        self.setIngredientsAndMeasures()
      })
      .store(in: &cancellables)
  }
  
  func getImageSaver(image: UIImage) {
    useCaseProvider.imageSaverUseCase.execute(image: image)
  }
  
  func longGestureAction(info: CategoryCellModel) {
    info.type == .categories ? longGestureActionCategory(info: info) : longGestureActionMeal(info: info)
  }
  
  func tapGestureAction(info: CategoryCellModel) {
    info.type == .categories ? tapGestureActionCategory(info: info) : tapGestureActionMeal(info: info)
  }
  
  @MainActor func downloadAndSaveImage(inputImage: Image) {
    guard let convertedImage: UIImage = inputImage.getUIImage() else { return }
    getImageSaver(image: convertedImage)
  }
  
  // MARK: - Private Methods
  private func longGestureActionCategory(info: CategoryCellModel) {
    setSelectedValues(info: info)
    showSheet = true
  }
  
  private func tapGestureActionCategory(info: CategoryCellModel) {
    setSelectedValues(info: info)
    getMealsList()
    isShowingCategories = false
  }
  
  private func longGestureActionMeal(info: CategoryCellModel) {
    setSelectedValues(info: info)
    showSheet = true
  }
  
  private func tapGestureActionMeal(info: CategoryCellModel) {
    setSelectedValues(info: info)
    presentRecipe = true
  }
  
  private func setSelectedValues(info: CategoryCellModel) {
    selectedValues.strCategory = info.text
    selectedValues.strCategoryDescription = info.descriptions
    selectedValues.strCategoryThumb = info.thumb
    selectedValues.idMeal = info.id
    selectedValues.strMeal = info.text
    selectedValues.strMealThumb = info.thumb
  }
  
  private func setIngredientsAndMeasures() {
    if let meal = meal.first {
      ingredients = meal.filteredIngredients()
      measures = meal.filteredMeasures()
    }
  }
}
