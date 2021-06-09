//
//  LoginPresenter.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import UIKit

typealias LoginPresenterInput = LoginInteractorOutput
typealias LoginPresenterOutput = LoginViewControllerInput

final class LoginPresenter {
    weak var viewController: LoginPresenterOutput?
}

extension LoginPresenter: LoginPresenterInput {
    func showLogingFailure(message: String) {
        dispatchPrecondition(condition: .onQueue(.main))
        let errorMessage: String

        #if DEBUG
        errorMessage = message
        #else
        errorMessage = ""
        #endif
        
        viewController?.showLogingFailure(message: """
            Oops, something failed on our side :(
            \(message)
            """)
    }
    
    func showLogingSuccess(user: User) {
        dispatchPrecondition(condition: .onQueue(.main))
        viewController?.showLogingSuccess(username: user.firstName + " " + user.lastName)
    }
 
}
