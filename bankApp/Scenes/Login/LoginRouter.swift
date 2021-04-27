//
//  LoginRouter.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import UIKit

protocol LoginRouting {
    func showLoginSuccess()
    func showLogingFailure(message: String)
}

class LoginRouter {
    weak var source: UIViewController?
    
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

extension LoginRouter: LoginRouting {
    func showLogingFailure(message: String) {
        let action = UIAlertAction(title: "OK", style: .destructive)
        let alertController
            = UIAlertController(title: "Login Failure",
                                message: message,
                                preferredStyle: .alert)
        alertController.addAction(action)
        source?.present(alertController, animated: true)
    }
    
    func showLoginSuccess() {
        let scene = sceneFactory.makeLoginScene()
        source?.navigationController?.pushViewController(scene, animated: true)
    }
}
