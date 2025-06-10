//
//  DogBreedImgViewModel.swift
//  DogBreeds
//
//  Created by Hasan Zaidi on 6/10/25.
//

import Foundation
import Combine

class DogBreedImgViewModel: ObservableObject {
    
    @Published var breeds_image: [DogImage] = []
//    Uncomment
    let networkManager = DogNetworkManager.shared
    
//    let networkManager = MockNetworkLayer()
    func fetchImages(breed: String) {
        Task {
            do {
                let result = try await networkManager.fetchDogImages(breed: breed)
                
                DispatchQueue.main.async {
                    self.breeds_image = result
                }
            } catch {
                print("Failed to fetch images: \(error)")
            }
        }
    }
}
