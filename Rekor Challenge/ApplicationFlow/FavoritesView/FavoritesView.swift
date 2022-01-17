//
//  FavoritesView.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/15/22.
//

import SwiftUI

struct FavoritesView: View {
    
    //var apods: [APOD]?
    @StateObject private var store = FavoritesViewStore()
    
    var body: some View {
        NavigationView {
            if store.isLoading {
                LoadingView()
            } else if store.errorMessage != nil {
                ErrorView(errorMessage: store.errorMessage ?? "Failted to retrieve favorites.")
            } else {
                if let apods = store.apods {
                    List {
                        ForEach(apods) { apod in
                            NavigationLink {
                                APODDetailView(apod: apod)
                            } label: {
                                APODListItem(apod: apod)
                            }
                        }
                    }.listStyle(.plain)
                }
            }
        }.navigationTitle("Favorites")
            .onAppear(perform: {
                store.getFavorites()
            })
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
