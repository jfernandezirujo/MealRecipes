//
//  ImageSaverUseCase.swift
//  MealRecipes
//
//  Created by Julieta Fernandez Irujo on 08/07/2024.
//

import UIKit

// MARK: - protocol
protocol ImageSaverUseCaseProtocol {
  func execute(image: UIImage)
}

// MARK: - GetPositionAPIClientUseCase
class ImageSaverUseCase: ImageSaverUseCaseProtocol {
  
  // MARK: - Properties
  private let repository: ImageSaverRepositoryProtocol
  
  // MARK: - init
  init(repository: ImageSaverRepositoryProtocol) {
    self.repository = repository
  }
  
  // MARK: - Methods
  func execute(image: UIImage) {
    return repository.writeToPhotoAlbum(image: image)
  }
}
