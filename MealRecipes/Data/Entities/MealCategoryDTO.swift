//
//  MealCategoryDTO.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

// MARK: - MealCategoryDTO
struct MealCategoryDTO: Decodable {
  
  var idCategory: String
  let strCategory: String
  let strCategoryThumb: String
  let strCategoryDescription: String
}

// MARK: - CategoriesResponse
struct CategoriesResponse: Decodable {
    let categories: [MealCategoryDTO]
}

// MARK: - extension MealCategoryDTO
extension MealCategoryDTO: Comparable {
  static func < (lhs: MealCategoryDTO,
                 rhs: MealCategoryDTO) -> Bool {
    return lhs.strCategory < rhs.strCategory
  }
}
