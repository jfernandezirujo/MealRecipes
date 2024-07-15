//
//  CategoryCellModel.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import Combine

enum CellType {
  case categories
  case meals
}

class CategoryCellModel: ObservableObject {
  
  // MARK: - Properties
  @Published var thumb: String
  @Published var text: String
  @Published var descriptions: String
  @Published var id: String
  @Published var type: CellType
  
  // MARK: - init
  init(type: CellType,
       thumb: String,
       text: String,
       description: String? = nil,
       id: String? = nil
  ) {
    self.type = type
    self.thumb = thumb
    self.text = text
    self.descriptions = description ?? ""
    self.id = id ?? ""
  }
}
