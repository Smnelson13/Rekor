//
//  APIControllerDelegate.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/13/22.
//

import Foundation

protocol APIControllerDelegate {
    func didReceiveResults(_ T: Codable)
    func errorLoadingData(_ err: Error)
}
