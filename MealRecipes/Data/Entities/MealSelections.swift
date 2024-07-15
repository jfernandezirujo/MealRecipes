//
//  MealSelections.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI

class MealSelectionsModel: ObservableObject {
  // MARK: - Properties
  @Published var strCategory: String
  @Published var strCategoryThumb: String
  @Published var strCategoryDescription: String
  @Published var strMeal: String
  @Published var strMealThumb: String
  @Published var idMeal: String
  
  // MARK: - init
  init(strCategory: String? = "",
       strCategoryThumb: String? = "",
       strCategoryDescription: String? = "",
       strMeal: String? = "",
       strMealThumb: String? = "",
       idMeal: String? = "") {
    self.strCategory = strCategory ?? ""
    self.strCategoryThumb = strCategoryThumb ?? ""
    self.strCategoryDescription = strCategoryDescription ?? ""
    self.strMeal = strMeal ?? ""
    self.strMealThumb = strMealThumb ?? ""
    self.idMeal = idMeal ?? ""
  }
}
  
