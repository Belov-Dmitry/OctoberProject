//
//  MainViewControllerCoordinator.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 13.02.2024.
//

import Foundation
import UIKit

class MainViewControllerCoordinator: Coordinator {

    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MainViewController()
        mainViewController.mainViewControllerCoordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func showSettings() {
        let settingsCoordinator = SettingsCoordinator(navigationController: navigationController)
        //add(coordinator: secondViewControllerCoordinator)
        settingsCoordinator.start()
        print("showSettings from MainViewControllerCoordinator")
    }
    
    
}

