//
//  SceneDelegate.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 05.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)

        let navController = UINavigationController()
        coordinator = AppCoordinator(navigationController: navController)
        coordinator?.start()

        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }
    
    

//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        
//        guard let windowScene = scene as? UIWindowScene else { return }
//        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = TabBarController()
//        self.window = window
//        window.makeKeyAndVisible()
//    }

    
}

