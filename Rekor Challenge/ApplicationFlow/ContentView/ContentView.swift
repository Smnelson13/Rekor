//
//  ContentView.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var store = ContentViewStore()
    
    var body: some View {
        NavigationView {
            if store.isLoading {
                LoadingView()
            } else if store.errorMessage != nil {
                ErrorView(errorMessage: store.errorMessage ?? "Failed to retrieve pictures.")
            } else {
                APODListView(apods: APOD.MockAPODS())
            }
        }.onAppear {
            store.getAPOTD()
        }
    }
    
    private func fetchAPOTD() {
        store.getAPOTD()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
