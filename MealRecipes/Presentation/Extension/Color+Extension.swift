//
//  Color+Extension.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import SwiftUI

extension Color {
  
  // MARK: - Properties
  typealias constants = PresentationConstants
  
  // MARK: - Custom Methods
  func complementaryColor() -> Color {
    let uiColor: UIColor = UIColor(self)
    let ciColor: CIColor = CIColor(color: uiColor)
    
    let red: CGFloat = constants.constantsOneFloat - ciColor.red
    let green: CGFloat = constants.constantsOneFloat - ciColor.green
    let blue: CGFloat = constants.constantsOneFloat - ciColor.blue
    
    return Color(red: red,
                 green: green,
                 blue: blue)
  }
}
