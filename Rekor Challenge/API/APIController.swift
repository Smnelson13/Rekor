//
//  APIController.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/11/22.
//

import Foundation

@MainActor class APIController: ObservableObject {
    
    @Published var apods = [APOD]()
    @Published var errorMessage: String? = nil
    
    func fetchAPOD(_ urlString: String, _ completion: @escaping (_ apod: APOD?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            errorMessage = APIError.invalidURL.localizedDescription
            completion(nil, APIError.invalidURL)
            return
        }
        URLSession.shared.makeRequest(url: url, expecting: APOD.self) { [unowned self] result in
            errorMessage = nil
            switch result {
                case .success(let response):
                completion(response, nil)
                case .failure(let error):
                self.errorMessage = error.localizedDescription
                completion(nil, error)
            }
        }
    }
    
    func fetchMultipleAPODS(_ urlString: String, _ completion: @escaping (_ apods: [APOD]?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            errorMessage = APIError.invalidURL.localizedDescription
            completion(nil, APIError.invalidURL)
            return
        }
        errorMessage = nil
        URLSession.shared.makeRequest(url: url, expecting: [APOD].self, completion: { [unowned self] result in
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                completion(nil, error)
            case .success(let result):
                print("Success")
                self.apods = result 
                print(result)
                completion(apods, nil)
            }
        })
    }
}
