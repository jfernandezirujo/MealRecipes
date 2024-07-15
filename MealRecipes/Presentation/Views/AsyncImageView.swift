//
//  AsyncImageView.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI

struct AsyncImageView: View {
  
  // MARK: - Proeprties
  let url: String
  let onAppear: (Image) -> Void
  
  // MARK: - body
  var body: some View {
    AsyncImage(url: URL(string: url)) { phase in
      if let image: Image = phase.image {
        image
          .resizable()
          .scaledToFit()
          .clipShape(.buttonBorder)
          .onAppear {
            onAppear(image)
          }
      } else {
        ProgressView()
          .progressViewStyle(.circular)
      }
    }
  }
}
