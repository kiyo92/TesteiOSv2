//
//  AccountInteractor.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation
typealias AccountInteractorInput = AccountViewControllerOutput

protocol AccountInteractorOutput: AnyObject {
    func showUserDataSuccess(user: UserAccountData)
    func showUserDataFailure(message: String)
}

final class AccountInteractor {
    var presenter: AccountPresenterInput?
    var accountRepository: AccountRepository?
}

extension AccountInteractor: AccountInteractorInput {
    func getUserData() {
        accountRepository?.getUserData(completion: { result in
            DispatchQueue.main.async { [weak self] in
                print(result.user?.name)
                self?.presenter?.showUserDataSuccess(user: result)
                
            }
        })
    }
}
