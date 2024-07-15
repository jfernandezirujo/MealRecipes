//
//  ImageSaverRepository.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import UIKit

// MARK: - protocol
protocol ImageSaverRepositoryProtocol {
  func writeToPhotoAlbum(image: UIImage)
}

// MARK: - ImageSaverRepository
class ImageSaverRepository: NSObject, ImageSaverRepositoryProtocol {
  
  // MARK: - Methods
  func writeToPhotoAlbum(image: UIImage) {
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
  }
}
