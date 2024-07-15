//
//  MealDescriptionSlideUpModel.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024..
//

import Combine

class MealDescriptionSlideUpModel: ObservableObject {
  // MARK: - Properties
  @Published var thumb: String
  @Published var text: String
  
  // MARK: - init
  init(thumb: String,
       text: String) {
    self.thumb = thumb
    self.text = text
  }
}
