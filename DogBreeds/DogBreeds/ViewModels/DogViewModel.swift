//
//  testViewModel.swift
//  DogBreeds
//
//  Created by Yassine Lamtalaa on 6/10/25.
//

import Foundation

@MainActor
class DogBreedsViewModel: ObservableObject {
    @Published var breeds: [DogBreed] = []

    func fetchBreeds() async {
        do {
            breeds = try await DogNetworkManager.shared.fetchBreeds()
        } catch {
            print("Failed to fetch dog breeds: \(error.localizedDescription)")
        }
    }
}
