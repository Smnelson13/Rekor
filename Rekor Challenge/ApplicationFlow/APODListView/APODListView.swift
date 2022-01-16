//
//  APODListView.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/15/22.
//

import SwiftUI

struct APODListView: View {
    
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
                .toolbar {
                    Button("Favorites") {
                        //print("Favorites button tapped")
//                        NavigationLink( {
//
//                        }
                    }
                }
        }.navigationTitle("Astronomy")
    }
}

struct APODListView_Previews: PreviewProvider {
    static var previews: some View {
        APODListView(apods: APOD.MockAPODS())
    }
}
