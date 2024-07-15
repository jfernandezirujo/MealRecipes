//
//  MealDescriptionSlideUpView.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI

struct MealDescriptionSlideUpView: View {
  
  // MARK: - Propertes
  @EnvironmentObject private var viewModel: CategorySelectionViewModel
  typealias constants = PresentationConstants
  var model: MealDescriptionSlideUpModel
  @State private var imagen: Image = Image("")

  // MARK: - body
  var body: some View {
    VStack {
      HStack{
        Spacer()
        Image(systemName: constants.downloadSymbol)
          .frame(width: constants.downloadSymbolFrame,
                 height: constants.downloadSymbolFrame)
          .onTapGesture {
            viewModel.downloadAndSaveImage(inputImage: imagen)
          }
      }
      .padding(.vertical, constants.downloadSymbolVerticalPadding)
      AsyncImageView(url: viewModel.selectedValues.strCategoryThumb,
                     onAppear: { image in
        imagen = image
      })
      .padding(.bottom, constants.asyncImageViewBottomPadding)
      Text(viewModel.selectedValues.strCategoryDescription)
    }
    .padding(.horizontal, constants.imageHorizontalPadding)
    .padding(.bottom, constants.cellSpacing)
  }
}
