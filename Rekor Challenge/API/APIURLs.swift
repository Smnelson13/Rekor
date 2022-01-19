//
//  APIURLs.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/17/22.
//

import Foundation

struct APIURLs {
    static func last30DaysURL(_ startDate: String, endDate: String) -> String {
        return "https://api.nasa.gov/planetary/apod?api_key=\(Keys.apiKey)&start_date=\(startDate)&end_date=\(endDate)"
    }
    
    static func apodOfTheDay() -> String {
        return "https://api.nasa.gov/planetary/apod?api_key=mHLf7hT8c503Pe0IQt7CIdd6roXA1gaAibzBydbH"
    }
}
