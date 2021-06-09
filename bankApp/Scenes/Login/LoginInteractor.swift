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
    var authRepository: LoginAuth?
}

extension LoginInteractor: LoginInteractorInput {
    func tryToLogIn() {
        authRepository?.makeAuth(completion: { result in
            DispatchQueue.main.async { [weak self] in
                self?.presenter?.showLogingSuccess(user: result)
                
            }
        })
    }
}
