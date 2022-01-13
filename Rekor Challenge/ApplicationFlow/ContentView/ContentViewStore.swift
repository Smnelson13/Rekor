//
//  ContentViewStore.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

extension ContentView {
    
    @MainActor class ContentViewStore: ObservableObject {
        
        typealias Handler = (ContentViewState) -> Void
        let apiController = APIController()
        var APOD: APOD?
        
        func getAPOTD() {
//            apiController.fetch(Constants.baseURL) {
//                print("APIController APOD fetch Complete.")
//            })
        }
    }
}
