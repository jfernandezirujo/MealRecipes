//
//  CategoryCellView.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI
import UIKit
import Combine

struct CategoryCellView: View {
  
  // MARK: - Properties
  let categoryCellModel: CategoryCellModel
  @State private var background: Color = .clear
  typealias constants = PresentationConstants
  @EnvironmentObject private var viewModel: CategorySelectionViewModel
  
  // MARK: - body
  var body: some View {
    VStack {
      AsyncImageView(url: categoryCellModel.thumb,
                     onAppear: { image in
        DispatchQueue.main.async {
          getColor(image: image)
        }
      })
      
      .padding(.top, constants.textTopPadding)
      Text(categoryCellModel.text)
        .font(.subheadline)
        .padding(.top, constants.textTopPadding)
        .lineLimit(constants.lineLimit)
    }
    .padding(.horizontal, constants.imageHorizontalPadding)
    .frame(height: constants.frameHeight)
    .background(
      background.complementaryColor()
    )
    .cornerRadius(constants.cornerRadious)
    .onTapGesture {
      viewModel.tapGestureAction(info: categoryCellModel)
    }
    .onLongPressGesture {
      viewModel.longGestureAction(info: categoryCellModel)
    }
  }
  
  // MARK: - Private Method
  @MainActor private func getColor(image: Image) {
    if let uiImage: UIImage = image.getUIImage(),
       let uiColor: UIColor = UIColor.dominantColor(from: uiImage) {
      DispatchQueue.main.async {
        background = Color(uiColor: uiColor)
      }
    }
  }
}
