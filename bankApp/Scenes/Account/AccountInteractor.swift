//
//  AccountInteractor.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation
typealias AccountInteractorInput = AccountViewControllerOutput

protocol AccountInteractorOutput: AnyObject {
    func showLogingSuccess(user: User)
    func showLogingFailure(message: String)
}

final class AccountInteractor {
    var presenter: AccountPresenterInput?
    var authWorker: LoginAuth?
}

extension AccountInteractor: AccountInteractorInput {
    func tryToLogIn() {
        authWorker?.makeAuth(completion: { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let data):
                    self?.presenter?.showLogingSuccess(user: data)
                case .failure(let error):
                    self?.presenter?.showLogingFailure(message: error.localizedDescription)
                }
            }
        })
    }
}
