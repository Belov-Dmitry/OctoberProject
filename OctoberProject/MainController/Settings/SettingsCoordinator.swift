//
//  SettingsCoordinator.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 13.02.2024.
//

import Foundation
import UIKit

final class SettingsCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let settingsViewController = SettingsViewController()
        settingsViewController.settingsCoordinator = self
        //navigationController.viewControllers.removeAll()
        navigationController.pushViewController(settingsViewController, animated: true)
    }
}
