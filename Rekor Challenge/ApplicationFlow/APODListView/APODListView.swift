//
//  APODListView.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/15/22.
//

import SwiftUI

struct APODListView: View {
    
    @State private var isShowingFavoritesView = false
    var apods: [APOD]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(apods) { apod in
                        NavigationLink {
                            APODDetailView(apod: apod)
                        } label: {
                            APODListItem(apod: apod)
                        }
                    }
                }.listStyle(.plain)
                    .toolbar {
                        ToolbarItem {
                            Button(action: { isShowingFavoritesView = true }) {
                                Text("Show Favorites")
                                //Image(systemName: "Show Favorites")
                            }
                        }
                    }.background(
                        NavigationLink(destination: FavoritesView(apods: APOD.MockAPODS()), isActive: $isShowingFavoritesView) {
                            EmptyView()
                        }.hidden()
                    )
            }
        }.navigationTitle("Astronomy Pics")
    }
    
    func NavigateToFavoritesView() {

    }
}

struct APODListView_Previews: PreviewProvider {
    static var previews: some View {
        APODListView(apods: APOD.MockAPODS())
    }
}
