//
//  AccountConfigurator.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation
protocol AccountConfigurator {
    func configured(_ vc: AccountViewController) -> AccountViewController
}

final class DefaultAccountConfigurator: AccountConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: AccountViewController) -> AccountViewController {
        sceneFactory.accountConfigurator = self
        let service = DefaultUserDataService(
            networkManager: DefaultNetworkManager(session: MockNetworkSession())
        )
        let accountRepository = AccountRepository(service: service)
        let interactor = AccountInteractor()
        let presenter = AccountPresenter()
        let router = LoginRouter(sceneFactory: sceneFactory)
        router.source = vc
        presenter.viewController = vc
        interactor.presenter = presenter
        interactor.accountRepository = accountRepository
        vc.interactor = interactor
        vc.router = router
        return vc
    }
}
