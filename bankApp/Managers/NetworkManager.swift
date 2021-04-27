//
//  NetworkManager.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation
import Combine

protocol NetworkManager {
    var session: NetworkSession { get }
    func publisher<T: Decodable>(for request: URLRequest) -> AnyPublisher<T, Error>
}

private extension NetworkManager {
    func makePublisher<T: Decodable>(request: URLRequest) -> AnyPublisher<T, Error> {
        session.publisher(for: request)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

struct DefaultNetworkManager: NetworkManager {
    private(set) var session: NetworkSession
    
    init(session: NetworkSession) {
        self.session = session
    }
    
    func publisher<T: Decodable>(for request: URLRequest) -> AnyPublisher<T, Error> {
        makePublisher(request: request)
    }
}
