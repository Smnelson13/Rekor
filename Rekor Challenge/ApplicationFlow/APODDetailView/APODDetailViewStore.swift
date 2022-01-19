//
//  APODDetailViewStore.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/18/22.
//

import Foundation

extension APODDetailView {
    
    @MainActor class APODDetailViewStore: ObservableObject {
        
        @Published private(set) var apods: [APOD]?
        @Published var isLoading: Bool = false
        @Published var errorMessage: String? = nil
        
        let defaults = UserDefaults.standard
        var favorites = [APOD]()

        // TODO - optimize favs, allow removing one, and don't add a new one if there is an old one.
        func favoriteAPOD(_ apod: APOD) {
            isLoading = true
            // try nilling out favs
            if let data = defaults.data(forKey: Keys.favoritesKey) {
                if let config = try? JSONDecoder().decode([APOD].self, from: data) {
                    favorites = config
                }
            }
            favorites.append(apod)
            if let encoded = try? JSONEncoder().encode(favorites) {
                defaults.set(encoded, forKey: Keys.favoritesKey)
                print("saved")
            }
            isLoading = false
        }
    }
}

