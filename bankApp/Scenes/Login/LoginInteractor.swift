//
//  LoginInteractor.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation

typealias LoginInteractorInput = LoginViewControllerOutput

protocol LoginInteractorOutput: AnyObject {
    func showLogingSuccess(user: User)
    func showLogingFailure(message: String)
}

final class LoginInteractor {
    var presenter: LoginPresenterInput?
    var authWorker: LoginAuth?
}

extension LoginInteractor: LoginInteractorInput {
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
