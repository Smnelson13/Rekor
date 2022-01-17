//
//  ContentViewStore.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

extension ContentView {
    
    @MainActor class ContentViewStore: ObservableObject {
        
        @Published private(set) var apods: [APOD]?
        @Published private(set) var apod: APOD?
        @Published var isLoading: Bool = false
        @Published var errorMessage: String? = nil
        
        let apiController = APIController()
        
        func getLast30APODS() {
            isLoading = true
            self.apiController.fetchMultipleAPODS(Constants.last30Days) { data, error in
                if let data = data {
                    print("Success - \(data)")
                    self.apods = data
                } else if let err = error {
                    print("ERROR loading data - \(err)")
                }
                self.isLoading = false
            }
        }
        
        func getSingleApod() {
            isLoading = true
            self.apiController.fetchAPOD(Constants.last30Days) { data, error in
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
