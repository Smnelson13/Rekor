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
            Text("This is text")
                .padding()
        }.onAppear(perform: fetchAPOTD)
    }
    
    private func fetchAPOTD() {
        store.getAPOTD()
        
    }
    
}


extension ContentView {
    func reduceAndUpdate(_ state: ContentViewState) {
        switch state {
        case .errorLoadingData(let error):
            print("Error Loading Data \(error.localizedDescription). ContentView")
        case .success:
            print("Successfully Loaded Data. ContentView")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
