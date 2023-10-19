//
//  AppCoordinator.swift
//  OctoberProject
//
//  Created by Вячеслав on 20.10.2023.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var isLoggedIn: Bool = false

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginViewController = LoginViewController(loginViewModel: LoginViewModel())
        loginViewController.coordinator = LoginCoordinator(navigationController: navigationController)
        navigationController.pushViewController(loginViewController, animated: true)
    }
}
