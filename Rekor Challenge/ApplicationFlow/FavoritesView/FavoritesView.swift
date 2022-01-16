//
//  FavoritesView.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/15/22.
//

import SwiftUI

struct FavoritesView: View {
    
    var apods: [APOD]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(apods) { apod in
                    NavigationLink {
                        APODDetailView(apod: apod)
                    } label: {
                        APODListItem(apod: apod)
                    }
                }
            }.listStyle(.plain)
        }.navigationTitle("Favorites")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(apods: APOD.MockAPODS())
    }
}
