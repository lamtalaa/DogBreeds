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

    let dog_breed: String
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.breeds_image, id: \.self) { image in
                HStack {
                    Spacer() // Push image to center
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
        }.onAppear {
            viewModel.fetchImages(breed: dog_breed)
        }
    }
}


