//
//  MealSelectedCategoryDTO.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

// MARK: - MealSelectedCategoryDTO
struct MealSelectedCategoryDTO: Decodable {
  var strMeal: String
  var strMealThumb: String
  var idMeal: String
}

// MARK: - MealsResponse
struct MealsResponse: Decodable {
    let meals: [MealSelectedCategoryDTO]
}

// MARK: - extension MealSelectedCategoryDTO
extension MealSelectedCategoryDTO: Comparable {
  static func < (lhs: MealSelectedCategoryDTO,
                 rhs: MealSelectedCategoryDTO) -> Bool {
    return lhs.strMeal < rhs.strMeal
  }
}
