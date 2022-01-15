//
//  APOD.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

struct APOD: Codable {
    
    let copyright: String
    let date: String
    let explanation: String
    let imageURL: String
    let hdImageURL: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case imageURL = "url"
        case hdImageURL = "hdurl"
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
    }

    

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        copyright = try values.decode(String.self, forKey: .copyright)
        date = try values.decode(String.self, forKey: .date)
        explanation = try values.decode(String.self, forKey: .explanation)
        imageURL = try values.decode(String.self, forKey: .imageURL)
        hdImageURL = try values.decode(String.self, forKey: .hdImageURL)
        mediaType = try values.decode(String.self, forKey: .mediaType)
        serviceVersion = try values.decode(String.self, forKey: .serviceVersion)
        title = try values.decode(String.self, forKey: .title)
    }

}
