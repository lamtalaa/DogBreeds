//
//  ContentView.swift
//  DogBreeds
//
//  Created by Yassine Lamtalaa on 6/10/25.
//

import SwiftUI

struct DogNamesList: View {
    @StateObject private var viewModel: DogBreedsViewModel

    init(networkManager: DogNetworkManagerProtocol) {
        _viewModel = StateObject(wrappedValue: DogBreedsViewModel(networkManager: networkManager))
    }

    var body: some View {
        NavigationStack {
            List(viewModel.breeds) { breed in
                NavigationLink(destination: makeBreedView(for: breed)) {
                    VStack(alignment: .leading) {
                        Text(breed.breed.capitalized)
                            .font(.headline)
                            .fontWeight(.bold)
                        if !breed.subBreeds.isEmpty {
                            Text(breed.subBreeds.joined(separator: ", "))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Dog Breeds")
            .task {
                await viewModel.fetchBreeds()
            }
        }
    }

    private func makeBreedView(for breed: DogBreed) -> some View {
        let imgViewModel = DogBreedImgViewModel(networkManager: viewModel.networkManager)
        return DogBreedsListView(dog_breed: breed.breed, viewModel: imgViewModel)
    }
}
