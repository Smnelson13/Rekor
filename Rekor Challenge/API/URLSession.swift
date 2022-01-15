//
//  URLSession.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

extension URLSession {
    
    func makeRequest<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T,Error>) -> Void ) {
        guard let url = url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

