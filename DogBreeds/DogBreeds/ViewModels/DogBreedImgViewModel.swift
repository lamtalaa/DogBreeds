//
//  DogBreedImgViewModel.swift
//  DogBreeds
//
//  Created by Hasan Zaidi on 6/10/25.
//

import Foundation

@MainActor
class DogBreedImgViewModel: ObservableObject {
    
    @Published var breeds_image: [DogImage] = []
    let networkManager: DogNetworkManagerProtocol

    init(networkManager: DogNetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchImages(breed: String) async {
        do {
            let result = try await networkManager.fetchDogImages(breed: breed)
            breeds_image = result
        } catch {
            print("Failed to fetch images: \(error)")
        }
    }
}
