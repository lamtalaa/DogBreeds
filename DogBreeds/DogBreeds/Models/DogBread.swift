//
//  testModel.swift
//  DogBreeds
//
//  Created by Yassine Lamtalaa on 6/10/25.
//

import Foundation

struct DogBreed: Identifiable {
    var id: String { breed }
    let breed: String
    let subBreeds: [String]
}

struct DogAPIResponse: Decodable {
    let message: [String: [String]]
    let status: String
}
