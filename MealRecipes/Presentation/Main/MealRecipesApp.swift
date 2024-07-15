//
//  MealRecipesApp.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI

@main
struct MealRecipesApp: App {
  
  // MARK: - Properties
  private let categorySelectionViewModel: CategorySelectionViewModel
  private let dependencies: AppDependencies
  
  // MARK: - init
  init() {
    self.dependencies = AppDependencies()
    self.categorySelectionViewModel = dependencies.setCategorySelectionViewModel()
  }
  
  // MARK: - body
  var body: some Scene {
    WindowGroup {
      CategorySelectionView()
        .environmentObject(categorySelectionViewModel)
    }
  }
}
