//
//  FavoritesViewStore.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/17/22.
//

import Foundation

extension FavoritesView {
    
    @MainActor class FavoritesViewStore: ObservableObject {
        
        @Published private(set) var apods: [APOD]?
        @Published var isLoading: Bool = false
        @Published var errorMessage: String? = nil
        
        func getFavorites() {
            isLoading = true
            if let data = UserDefaults.standard.data(forKey: Keys.favoritesKey) {
                let config = try? JSONDecoder().decode([APOD].self, from: data)
                apods = config
            } else {
                errorMessage = "Unable To Retrieve Favorites."
            }
            isLoading = false
        }
    }
}
