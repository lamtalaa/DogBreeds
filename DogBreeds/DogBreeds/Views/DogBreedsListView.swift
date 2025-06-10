//
//  DogBreedsListView.swift
//  DogBreeds
//
//  Created by Hasan Zaidi on 6/10/25.
//

import Foundation
import SwiftUI

struct DogBreedsListView: View {
    
    @StateObject private var viewModel = DogBreedImgViewModel()
    @State private var showAllImages = false
    
    let dog_breed: String
    
    var body: some View {
        NavigationStack {
            List(displayedImages, id: \.self) { image in
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: image.url)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 80, height: 80)
                        case .success(let img):
                            img
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                                .clipped()
                                .cornerRadius(8)
                        case .failure(_):
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    Spacer()
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Dog Breeds")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !showAllImages && viewModel.breeds_image.count > 3 {
                        Button("View More") {
                            showAllImages = true
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchImages(breed: dog_breed)
        }
    }

    /// Only show first 3 unless toggled
    private var displayedImages: [DogImage] {
        showAllImages ? viewModel.breeds_image : Array(viewModel.breeds_image.prefix(3))
    }
}
