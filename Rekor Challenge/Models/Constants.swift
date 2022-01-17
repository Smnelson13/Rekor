//
//  Constants.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/12/22.
//

import Foundation

//struct APIURLs {
//
//    let formatter = DateFormatter()
//
//    static func last30Days() -> String {
//
//        var url = ""
//         return url
//    }
//}

enum Constants {
    static let baseURL = "https://api.nasa.gov/planetary/apod?api_key=mHLf7hT8c503Pe0IQt7CIdd6roXA1gaAibzBydbH"
    //static let last30Days = "https://api.nasa.gov/planetary/apod?api_key=mHLf7hT8c503Pe0IQt7CIdd6roXA1gaAibzBydbH"
    static let last30Days = "https://api.nasa.gov/planetary/apod?api_key=mHLf7hT8c503Pe0IQt7CIdd6roXA1gaAibzBydbH&start_date=2017-07-08&end_date=2017-07-10"
}
