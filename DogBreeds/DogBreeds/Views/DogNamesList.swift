//
//  ContentView.swift
//  DogBreeds
//
//  Created by Yassine Lamtalaa on 6/10/25.
//

import SwiftUI

struct DogNamesList: View {
    @StateObject private var viewModel = DogBreedsViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.breeds) { breed in
                NavigationLink(destination: DogBreedsListView(dog_breed: breed.breed)) {
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
}

// TEST Cmment


