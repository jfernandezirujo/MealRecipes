//
//  Image+Extension.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI

extension Image {
  @MainActor
  func getUIImage() -> UIImage? {
    let image: some View = resizable()
      .scaledToFill()
      .clipped()
    return ImageRenderer(content: image).uiImage
  }
}
