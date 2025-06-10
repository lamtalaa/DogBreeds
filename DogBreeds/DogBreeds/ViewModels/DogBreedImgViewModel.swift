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
//    let networkManager = NetworkManager()
    
    let networkManager = MockNetworkLayer()
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
        
    init() {
        loadMockData()
    }
        
    func loadMockData() {
        breeds_image = [
            DogImage(url: "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg"),
            DogImage(url: "https://images.dog.ceo/breeds/retriever-golden/n02099601_3004.jpg"),
            DogImage(url: "https://images.dog.ceo/breeds/poodle-standard/n02113799_4000.jpg"),
            DogImage(url: "https://images.dog.ceo/breeds/terrier-norwich/n02094258_5000.jpg"),
        ]
    }
}
