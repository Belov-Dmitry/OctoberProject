//
//  TabBarController.swift
//  OctoberProject
//
//  Created by Mishana on 06.10.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        setupTabBarItem()
    }
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let heightTabBar = round(view.frame.height / 10)
        tabBar.frame.size.height = heightTabBar
        tabBar.frame.origin.y = view.frame.height - heightTabBar
    }
}

private extension TabBarController {
    func getControllers(for tab: Tab) -> UIViewController {
        switch tab {
        case .profile: UINavigationController(rootViewController: ProfileViewController())
        case .map: MapViewController()
        case .message: MessageViewController()
        }
    }
    func configureApperance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = Resources.Colors.lightBlue
        tabBar.unselectedItemTintColor = Resources.Colors.gray
        tabBar.layer.borderColor = Resources.Colors.lightGray?.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
    }
    func setupTabBarItem() {
        let controllers = Tab.allCases.map { tab in
            let controller = getControllers(for: tab)
            controller.tabBarItem = UITabBarItem(
                title: "",
                image: Resources.Images.TabBar.icon(for: tab),
                tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
}
