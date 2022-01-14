//
//  APIController.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

class APIController {
    
    var delegate: APIControllerDelegate?
    
    func fetchAPOD(_ urlString: String, _ completion: @escaping (_ T: Codable?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.request(url: url, expecting: APOD.self) {  result in
            switch result {
                case .success(let response):
                completion(response, nil)
                case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
