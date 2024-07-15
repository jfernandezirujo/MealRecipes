//
//  ContentView.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI

struct CategorySelectionView: View {
  
  // MARK: - Properties
  typealias constants = PresentationConstants
  @EnvironmentObject private var viewModel: CategorySelectionViewModel
  let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  // MARK: - body
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: columns,
                  spacing: constants.cellSpacing) {
          list
        }
                  .padding()
      }
      .navigationTitle(constants.categoryViewTitle)
      .onAppear {
        onAppearActions()
      }
      .sheet(isPresented: $viewModel.showSheet) {
        slideUp
      }
      .navigationBarItems(leading: backButton)
      .navigationDestination(isPresented: $viewModel.presentRecipe,
                             destination: {
        DetailView()
      })
    }
  }
  
  // MARK: - Subview
  var list: some View {
    if viewModel.isShowingCategories {
      AnyView(
        ForEach(viewModel.categories, id: \.idCategory) { category in
          CategoryCellView(categoryCellModel: CategoryCellModel(type: .categories,
                                                                thumb: category.strCategoryThumb,
                                                                text: category.strCategory,
                                                                description: category.strCategoryDescription))
        }
      )
    } else {
      AnyView(
        ForEach(viewModel.meals, id: \.idMeal) { meal in
          CategoryCellView(categoryCellModel: CategoryCellModel(type: .meals,
                                                                thumb: meal.strMealThumb,
                                                                text: meal.strMeal,
                                                                id: meal.idMeal))
        }
      )
    }
  }
  
  private var backButton : some View {
    if viewModel.isShowingCategories {
      AnyView(EmptyView())
    } else {
      AnyView(
        Button(action: {
          viewModel.isShowingCategories = true
        }) {
          Image(systemName: constants.backButtonChevron)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.black)
        })
    }
  }
  
  private var slideUp: some View {
    MealDescriptionSlideUpView(model: MealDescriptionSlideUpModel(thumb: viewModel.selectedValues.strCategoryThumb,
                                                                  text: viewModel.selectedValues.strCategory))
    .presentationDetents([.medium, .large])
    .presentationBackground(.thinMaterial)
    .presentationCornerRadius(constants.slideUpCornerRadius)
    .presentationBackgroundInteraction(.disabled)
  }
  
  // MARK: - Private Methods
  private func onAppearActions() {
    DispatchQueue.main.async {
      if viewModel.isShowingCategories {
        viewModel.getMealCategories()
      } else {
        viewModel.getMealsList()
      }
    }
  }
}
