//
//  AppDelegate.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let sceneFactory = DefaultSceneFactory()
        sceneFactory.configurator = DefaultLoginConfigurator(sceneFactory: sceneFactory)
        let navController = UINavigationController(rootViewController: sceneFactory.makeLoginScene())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}

