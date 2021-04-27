//
//  AuthService.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation
import Combine
protocol AuthService {
    func auth() -> AnyPublisher<DefaultAuthService.Response, Error>
}

struct DefaultAuthService: AuthService {
    struct Response: Decodable {
        let authorized: Bool
        let user: User?
        
        struct User: Decodable {
            let firstName: String
            let lastName: String
        }
    }

    struct ServiceError: Decodable, Error {
        let message: String
    }
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func auth() -> AnyPublisher<Response, Error> {
        networkManager.publisher(
            for: URLRequest(url: URL(string: "nothttps://netguru.com/api/authMeInPlease")!)
        )
    }
}
