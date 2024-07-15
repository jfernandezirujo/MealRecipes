//
//  UIColor+Extension.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import UIKit

extension UIColor {
  
  // MARK: - Properties
  typealias constants = PresentationConstants
  
  // MARK: - Custom Method
  static func dominantColor(from image: UIImage) -> UIColor? {
    guard let ciImage: CIImage = CIImage(image: image) else { return nil }
    
    let extentVector: CIVector = CIVector(x: ciImage.extent.origin.x,
                                          y: ciImage.extent.origin.y,
                                          z: ciImage.extent.size.width,
                                          w: ciImage.extent.size.height)
    
    guard let filter: CIFilter = CIFilter(name: constants.nameCIFilter,
                                          parameters: [kCIInputImageKey: ciImage,
                                                      kCIInputExtentKey: extentVector]) else { return nil }
    guard let outputImage: CIImage = filter.outputImage else { return nil }
    
    var bitmap: [UInt8] = [UInt8](repeating: .zero,
                                  count: constants.constantsFour)
    let context: CIContext = CIContext()
    context.render(outputImage,
                   toBitmap: &bitmap,
                   rowBytes: constants.constantsFour,
                   bounds: CGRect(x: .zero,
                                  y: .zero,
                                  width: constants.constantsOne,
                                  height: constants.constantsOne),
                   format: .RGBA8,
                   colorSpace: nil)
    
    return UIColor(red: CGFloat(bitmap[.zero]) / constants.colorDivider,
                   green: CGFloat(bitmap[constants.constantsOne]) / constants.colorDivider,
                   blue: CGFloat(bitmap[constants.constantsTwo]) / constants.colorDivider,
                   alpha: CGFloat(bitmap[constants.constantsThree]) / constants.colorDivider)
  }
}
