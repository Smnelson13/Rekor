//
//  ContentViewStore.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

extension ContentView {
    
    @MainActor class ContentViewStore: ObservableObject {
        
        @Published private(set) var apod: APOD?
        @Published var isLoading: Bool = false
        @Published var errorMessage: String? = nil
        
        let apiController = APIController()
        
        func getAPOTD() {
            isLoading = true
            apiController.fetchAPOD(Constants.baseURL) { data, error in
                if let data = data {
                    print("Success - \(data)")
                    self.apod = data
                } else if let err = error {
                    print("ERROR loading data - \(err)")
                }
                self.isLoading = false
            }
        }
    }
}
