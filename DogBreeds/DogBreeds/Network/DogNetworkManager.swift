//
//  testNetwork.swift
//  DogBreeds
//
//  Created by Yassine Lamtalaa on 6/10/25.
//

import Foundation

class DogNetworkManager {
    static let shared = DogNetworkManager()
    private init() {}

//    private var breedsCache: [DogBreed]?
//    private var imagesCache: [String: [DogImage]] = [:]

    func fetchBreeds() async throws -> [DogBreed] {
//        if let cachedBreeds = breedsCache {
//            return cachedBreeds
//        }

        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(DogAPIResponse.self, from: data)

        let breeds = decoded.message.map { breed, subBreeds in
            DogBreed(breed: breed, subBreeds: subBreeds)
        }.sorted { $0.breed < $1.breed }

//        breedsCache = breeds
        return breeds
    }

    func fetchDogImages(breed: String) async throws -> [DogImage] {
//        if let cachedImages = imagesCache[breed] {
//            return cachedImages
//        }

        guard let url = URL(string: "https://dog.ceo/api/breed/\(breed)/images") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(DogBreedImgModel.self, from: data)

        let images = decoded.message.map { DogImage(url: $0) }
//        imagesCache[breed] = images

        return images
    }
}
