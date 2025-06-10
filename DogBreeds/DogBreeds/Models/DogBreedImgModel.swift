//
//  DogBreedImgModel.swift
//  DogBreeds
//
//  Created by Hasan Zaidi on 6/10/25.
//

import Foundation

struct DogBreedImgModel: Decodable {
    let message: [String]
}

struct DogImage: Identifiable, Hashable {
    let id = UUID()
    let url: String
}
