//
//  DogBreedsApp.swift
//  DogBreeds
//
//  Created by Yassine Lamtalaa on 6/10/25.
//

import SwiftUI

@main
struct DogBreedsApp: App {
    var body: some Scene {
        WindowGroup {
            let networkManager = DogNetworkManager()
            DogNamesList(networkManager: networkManager)
        }
    }
}
