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
    let url: String
    let hdurl: String
    let media_type: String
    let service_version: String
    let title: String
    
    
    //TODO: - Fix decodable and codable.
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        try
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
////        try container.encode(age, forKey: .age)
////
////        var name = container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .name)
////        try name.encode(firstName, forKey: .firstName)
////        try name.encode(lastName, forKey: .lastName)
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case hdImageURL = "hdurl"
//        case imageURL = ""
//    }

}
