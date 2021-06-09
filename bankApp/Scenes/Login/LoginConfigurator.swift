//
//  LoginConfigurator.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation
protocol LoginConfigurator {
    func configured(_ vc: LoginViewController) -> LoginViewController
}

final class DefaultLoginConfigurator: LoginConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: LoginViewController) -> LoginViewController {
        sceneFactory.configurator = self
        let service = DefaultAuthService(
            networkManager: DefaultNetworkManager(session: MockNetworkSession())
        )
        let authRepository = LoginRepository(service: service)
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter(sceneFactory: sceneFactory)
        router.source = vc
        presenter.viewController = vc
        interactor.presenter = presenter
        interactor.authRepository = authRepository
        vc.interactor = interactor
        vc.router = router
        return vc
    }
}
