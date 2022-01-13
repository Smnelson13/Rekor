//
//  APIController.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

class APIController {
    
    func fetchAPOD(_ urlString: String, _ completion: @escaping (APOD) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.request(url: url, expecting: APOD.self) {  result in
            switch result {
                case .success(let result):
                print(result)
                //completion(.success(result))
                case .failure(let error):
                print(error)
                //completion(.failure(error))
            }
        }
    }
}
