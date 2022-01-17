//
//  APOD.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

struct APOD: Codable, Identifiable {
    //var id: ObjectIdentifier
    
    let id: UUID = UUID()
    let copyright: String?
    let date: String
    let explanation: String
    let imageURL: String
    let hdImageURL: String?
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

        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        date = try values.decode(String.self, forKey: .date)
        explanation = try values.decode(String.self, forKey: .explanation)
        imageURL = try values.decode(String.self, forKey: .imageURL)
        hdImageURL = try values.decodeIfPresent(String.self, forKey: .hdImageURL)
        mediaType = try values.decode(String.self, forKey: .mediaType)
        serviceVersion = try values.decode(String.self, forKey: .serviceVersion)
        title = try values.decode(String.self, forKey: .title)
    }

    init(copyright: String?, date: String, explantation: String, imageURL: String, hdImageURL: String?, mediaType: String, serviceVersion: String, title: String) {
        self.copyright = copyright
        self.date = date
        self.explanation = explantation
        self.imageURL = imageURL
        self.hdImageURL = hdImageURL
        self.mediaType = mediaType
        self.serviceVersion = serviceVersion
        self.title = title
    }
    
    static func MockAPOD() -> APOD {
        return APOD(copyright: "Matt HarbisonSpace4Everybody", date: "2022-01-11", explantation: "You may have seen Orion's belt before -- but not like this. The three bright stars across this image are, from left to right, Mintaka, Alnilam, and Alnitak: the iconic belt stars of Orion. The rest of the stars in the frame have been digitally removed to highlight the surrounding clouds of glowing gas and dark dust. Some of these clouds have intriguing shapes, including the Horsehead and Flame Nebulas, both near Alnitak on the lower right.  This deep image, taken last month from the Marathon Skypark and Observatory in Marathon, Texas, USA, spans about 5 degrees, required about 20 hours of exposure, and was processed to reveal the gas and dust that we would really see if we were much closer. The famous Orion Nebula is off to the upper right of this colorful field.  The entire region lies only about 1,500 light-years distant and so is one of the closest and best studied star formation nurseries known.    Tonight: APOD Editor to Present the Best Space Images of 2021", imageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_1080.jpg", hdImageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_5000.jpg", mediaType: "image", serviceVersion: "v1", title: "Orion's Belt Region in Gas and Dust")
    }
    
    static func MockAPODS() -> [APOD] {
        return [
            APOD(copyright: "Matt HarbisonSpace4Everybody", date: "2022-01-11", explantation: "You may have seen Orion's belt before -- but not like this. The three bright stars across this image are, from left to right, Mintaka, Alnilam, and Alnitak: the iconic belt stars of Orion. The rest of the stars in the frame have been digitally removed to highlight the surrounding clouds of glowing gas and dark dust. Some of these clouds have intriguing shapes, including the Horsehead and Flame Nebulas, both near Alnitak on the lower right.  This deep image, taken last month from the Marathon Skypark and Observatory in Marathon, Texas, USA, spans about 5 degrees, required about 20 hours of exposure, and was processed to reveal the gas and dust that we would really see if we were much closer. The famous Orion Nebula is off to the upper right of this colorful field.  The entire region lies only about 1,500 light-years distant and so is one of the closest and best studied star formation nurseries known.    Tonight: APOD Editor to Present the Best Space Images of 2021", imageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_1080.jpg", hdImageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_5000.jpg", mediaType: "image", serviceVersion: "v1", title: "Orion's Belt Region in Gas and Dust"),
            APOD(copyright: "Matt HarbisonSpace4Everybody", date: "2022-01-11", explantation: "You may have seen Orion's belt before -- but not like this. The three bright stars across this image are, from left to right, Mintaka, Alnilam, and Alnitak: the iconic belt stars of Orion. The rest of the stars in the frame have been digitally removed to highlight the surrounding clouds of glowing gas and dark dust. Some of these clouds have intriguing shapes, including the Horsehead and Flame Nebulas, both near Alnitak on the lower right.  This deep image, taken last month from the Marathon Skypark and Observatory in Marathon, Texas, USA, spans about 5 degrees, required about 20 hours of exposure, and was processed to reveal the gas and dust that we would really see if we were much closer. The famous Orion Nebula is off to the upper right of this colorful field.  The entire region lies only about 1,500 light-years distant and so is one of the closest and best studied star formation nurseries known.    Tonight: APOD Editor to Present the Best Space Images of 2021", imageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_1080.jpg", hdImageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_5000.jpg", mediaType: "image", serviceVersion: "v1", title: "Orion's Belt Region in Gas and Dust"),
            APOD(copyright: "Matt HarbisonSpace4Everybody", date: "2022-01-11", explantation: "You may have seen Orion's belt before -- but not like this. The three bright stars across this image are, from left to right, Mintaka, Alnilam, and Alnitak: the iconic belt stars of Orion. The rest of the stars in the frame have been digitally removed to highlight the surrounding clouds of glowing gas and dark dust. Some of these clouds have intriguing shapes, including the Horsehead and Flame Nebulas, both near Alnitak on the lower right.  This deep image, taken last month from the Marathon Skypark and Observatory in Marathon, Texas, USA, spans about 5 degrees, required about 20 hours of exposure, and was processed to reveal the gas and dust that we would really see if we were much closer. The famous Orion Nebula is off to the upper right of this colorful field.  The entire region lies only about 1,500 light-years distant and so is one of the closest and best studied star formation nurseries known.    Tonight: APOD Editor to Present the Best Space Images of 2021", imageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_1080.jpg", hdImageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_5000.jpg", mediaType: "image", serviceVersion: "v1", title: "Orion's Belt Region in Gas and Dust"),
            APOD(copyright: "Matt HarbisonSpace4Everybody", date: "2022-01-11", explantation: "You may have seen Orion's belt before -- but not like this. The three bright stars across this image are, from left to right, Mintaka, Alnilam, and Alnitak: the iconic belt stars of Orion. The rest of the stars in the frame have been digitally removed to highlight the surrounding clouds of glowing gas and dark dust. Some of these clouds have intriguing shapes, including the Horsehead and Flame Nebulas, both near Alnitak on the lower right.  This deep image, taken last month from the Marathon Skypark and Observatory in Marathon, Texas, USA, spans about 5 degrees, required about 20 hours of exposure, and was processed to reveal the gas and dust that we would really see if we were much closer. The famous Orion Nebula is off to the upper right of this colorful field.  The entire region lies only about 1,500 light-years distant and so is one of the closest and best studied star formation nurseries known.    Tonight: APOD Editor to Present the Best Space Images of 2021", imageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_1080.jpg", hdImageURL: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_5000.jpg", mediaType: "image", serviceVersion: "v1", title: "Orion's Belt Region in Gas and Dust")
        ]
    }

}

