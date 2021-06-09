//
//  LoginRepository.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 09/06/21.
//

import Foundation
import Combine
protocol LoginAuth {
    func makeAuth(
        completion: @escaping (User) -> Void)
}

final class LoginRepository {
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

extension LoginRepository: LoginAuth {
    func makeAuth(completion: @escaping (User) -> Void) {
        completion(service.auth())
    }
}
