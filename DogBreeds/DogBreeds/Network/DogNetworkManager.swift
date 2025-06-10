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

    func fetchBreeds() async throws -> [DogBreed] {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(DogAPIResponse.self, from: data)

        let breeds = decoded.message.map { breed, subBreeds in
            DogBreed(breed: breed, subBreeds: subBreeds)
        }.sorted { $0.breed < $1.breed }

        return breeds
    }
}
