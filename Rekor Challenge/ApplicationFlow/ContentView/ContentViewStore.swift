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
            let urlString = APIURLs.last30DaysURL(dateThirtyDaysAgoFormatted(), endDate: currentDateFormatted())
            isLoading = true
            self.apiController.fetchMultipleAPODS(urlString) { data, error in
                DispatchQueue.main.async {
                    if let data = data {
                        print("Success - \(data)")
                        self.apods = data
                    } else if let err = error {
                        print("ERROR loading data - \(err)")
                    }
                    self.isLoading = false
                }
            }
        }
        
        func getApodOfTheDay() {
            isLoading = true
            self.apiController.fetchAPOD(APIURLs.apodOfTheDay()) { data, error in
                DispatchQueue.main.async {
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

        func currentDateFormatted() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let currentDateFormatted = formatter.string(from: Date())
            
            return currentDateFormatted
        }
        
        func dateThirtyDaysAgoFormatted() -> String {
            guard let thirtyDaysBeforeDate = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else {
                return ""
            }
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = formatter.string(from: thirtyDaysBeforeDate)
            
            return formattedDate
        }
    }
}
