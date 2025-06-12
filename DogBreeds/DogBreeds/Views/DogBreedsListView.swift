//
//  DogBreedsListView.swift
//  DogBreeds
//
//  Created by Hasan Zaidi on 6/10/25.
//

import Foundation
import SwiftUI
import Kingfisher

struct DogBreedsListView: View {
    
    @StateObject private var viewModel = DogBreedImgViewModel()
    @State private var showAllImages = false
    
    let dog_breed: String
    
    var body: some View {
        NavigationStack {
            List(displayedImages, id: \.self) { image in
                HStack {
                    Spacer()
                    KFImage(URL(string: image.url))
                        .placeholder {
                            ProgressView()
                                .frame(width: 80, height: 80)
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(8)
                    Spacer()
                }
                .padding(.vertical, 5)
            }
            .navigationTitle(dog_breed)
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
        .task {
            viewModel.fetchImages(breed: dog_breed)
        }
    }

    /// Only show first 3 unless toggled
    private var displayedImages: [DogImage] {
        showAllImages ? viewModel.breeds_image : Array(viewModel.breeds_image.prefix(3))
    }
}


#Preview {
    DogBreedsListView(dog_breed: "labrador")
}
