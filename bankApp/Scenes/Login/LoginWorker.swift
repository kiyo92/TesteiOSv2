//
//  LoginWorker.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation
import Combine
protocol LoginAuth {
    func makeAuth(
        completion: @escaping (Result<User, LoginWorker.LoginWorkerError>
        ) -> Void)
}

final class LoginWorker {
    private let service: AuthService
    private var bag = Set<AnyCancellable>()
    
    init(service: AuthService) {
        self.service = service
    }
    
    enum LoginWorkerError: Error {
        case authFailed(String)
        case unauthorized
    }
}

extension LoginWorker: LoginAuth {
    func makeAuth(
        completion: @escaping (Result<User, LoginWorkerError>
        ) -> Void) {
        service.auth()
            .sink { status in
                
            } receiveValue: {  value in
                switch value.authorized {
                case true:
                    guard let user = value.user else {
                        completion(.failure(.authFailed("user data empty")))
                        return
                    }
                    let userModel
                        = User(firstName: user.firstName,
                                         lastName: user.lastName)
                    completion(.success(userModel))
                case false:
                    completion(.failure(.unauthorized))
                }
                //self?.logger.info("value received \(String(describing: value))")
            }
            .store(in: &bag)
    }
}
