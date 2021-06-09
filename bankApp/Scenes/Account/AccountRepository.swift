//
//  AccountRepository.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 09/06/21.
//

import Foundation
import Combine
protocol AccountDataRepository {
    func getUserData(
        completion: @escaping (UserAccountData) -> Void)
}

final class AccountRepository {
    private let service: UserDataService
    private var bag = Set<AnyCancellable>()
    
    init(service: UserDataService) {
        self.service = service
    }
    
    enum LoginWorkerError: Error {
        case authFailed(String)
        case unauthorized
    }
}

extension AccountRepository: AccountDataRepository {
    func getUserData(completion: @escaping (UserAccountData) -> Void) {
        completion(service.getUserData())
    }
}
