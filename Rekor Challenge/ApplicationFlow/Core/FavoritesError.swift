//
//  FavoritesError.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/18/22.
//

import Foundation

enum FavoritesError: LocalizedError {
    case alreadyFavorited
    case savedInDefaults

    var errorDescription: String? {
        switch self {
        case .alreadyFavorited:
            return "Already in Favorites."
        case .savedInDefaults:
            return "Saved!"
        }
    }
}
