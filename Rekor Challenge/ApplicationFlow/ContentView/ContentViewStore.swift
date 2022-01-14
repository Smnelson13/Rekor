//
//  ContentViewStore.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

extension ContentView {
    
    @MainActor class ContentViewStore: ObservableObject {
        
        @Published var apod: APOD?
        
        let apiController = APIController()
        
        func getAPOTD() {            
            apiController.fetchAPOD(Constants.baseURL) { data, error in
                if let data = data {
                    print("Success - \(data)")
                } else if let err = error {
                    print("ERROR loading data - \(err)")
                }
            }
        }
    }
}
