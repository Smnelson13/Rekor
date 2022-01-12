//
//  APIController.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

class APIController {
    
    func fetch<T: Codable>(_ urlString: String, _ completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.request(url: url, expecting: T.self) {  result in
            switch result {
                case .success(let result):
                completion(.success(result))
                case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
