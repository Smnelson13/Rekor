//
//  APODDetailViewStore.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/18/22.
//

import Foundation
import SwiftUI

extension APODDetailView {
    
    @MainActor class APODDetailViewStore: ObservableObject {
        
        @Published private(set) var apods: [APOD]?
        @Published var isLoading: Bool = false
        @Published var errorMessage: String? = nil
        
        let defaults = UserDefaults.standard
        var favorites = [APOD]()

        func favoriteAPOD(_ apod: APOD) {
            isLoading = true
            favorites = []
            var isFavorited: Bool = false
            
            if let data = defaults.data(forKey: Keys.favoritesKey) {
                if let config = try? JSONDecoder().decode([APOD].self, from: data) {
                    favorites = config
                }
            }
        
            for favorite in favorites {
                if favorite.imageURL == apod.imageURL {
                    isFavorited = true
                }
            }

            if isFavorited {
                errorMessage = "Already in Favorites"
            } else if !isFavorited {
                favorites.append(apod)
                if let encoded = try? JSONEncoder().encode(favorites) {
                    defaults.set(encoded, forKey: Keys.favoritesKey)
                    print("saved")
                }
            }
            isLoading = false
        }
    }
}

