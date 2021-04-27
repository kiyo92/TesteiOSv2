//
//  SceneFactory.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import UIKit
protocol SceneFactory {
    var configurator: LoginConfigurator! { get set }
    func makeLoginScene() -> UIViewController
    
    var accountConfigurator: AccountConfigurator! { get set }
    func makeAccountScene() -> UIViewController
}

final class DefaultSceneFactory: SceneFactory {
    
    var configurator: LoginConfigurator!
    
    func makeLoginScene() -> UIViewController {
        let vc = LoginViewController()
        return configurator.configured(vc)
    }
    
    var accountConfigurator: AccountConfigurator!
    
    func makeAccountScene() -> UIViewController {
        let vc = AccountViewController()
        return accountConfigurator.configured(vc)
    }
    
}
