//
//  LoginRouter.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import UIKit

protocol LoginRouting {
    func showLoginSuccess()
}

class LoginRouter {
    weak var source: UIViewController?
    
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

extension LoginRouter: LoginRouting {
    
    func showLoginSuccess() {
        let scene = sceneFactory.makeAccountScene()
        source?.navigationController?.pushViewController(scene, animated: true)
    }
}
