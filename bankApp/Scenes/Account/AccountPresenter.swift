//
//  AccountPresenter.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import UIKit

typealias AccountPresenterInput = AccountInteractorOutput
typealias AccountPresenterOutput = AccountViewControllerInput

final class AccountPresenter {
    weak var viewController: AccountPresenterOutput?
}

extension AccountPresenter: AccountPresenterInput {
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
        viewController?.showLogingSuccess(fullUserName: user.firstName + " " + user.lastName)
    }
 
}
