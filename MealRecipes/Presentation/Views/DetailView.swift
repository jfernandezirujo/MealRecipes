//
//  DetailView.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI

struct DetailView: View {
  
  // MARK: - Properties
  typealias constants = PresentationConstants
  @EnvironmentObject private var viewModel: CategorySelectionViewModel
  @Environment(\.dismiss) var dismiss
  
  // MARK: - body
  var body: some View {
    NavigationStack {
      Form {
        Section() {
          Text(viewModel.selectedValues.strMeal)
            .bold()
        }
        Section() {
          AsyncImageView(url: viewModel.meal.first?.strMealThumb ?? "",
                         onAppear: { _ in })
        }
        Section(constants.instructionsTitle) {
          Text(viewModel.meal.first?.strInstructions ?? "")
        }
        Section(constants.ingredientsTitle) {
          ingredients
        }
      }
      
      .toolbar() {
        dismissButton
      }
      .navigationTitle(constants.categoryViewTitle)
      .navigationBarBackButtonHidden(true)
    }
    .onAppear {
      viewModel.getMealRecipe()
    }
  }
  
  // MARK: - subviews
  private var ingredients: some View {
    return AnyView(
      ForEach(.zero..<viewModel.ingredients.count, id: \.self) { index in
        HStack {
          Text(viewModel.ingredients[index])
          Spacer()
          Text(viewModel.measures[index])
        }
      }
    )
  }
  
  private var dismissButton: some View {
    Button(constants.doneButton) {
      dismiss()
    }
    .foregroundColor(.black)
  }
}
