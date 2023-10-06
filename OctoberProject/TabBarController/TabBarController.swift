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
    
    func configureApperance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .tintColor
        tabBar.barTintColor = UIColor(named: "LowPanelItem")
        
        tabBar.layer.borderColor = UIColor(named: "LowPanelItem")?.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
    }
    
    func setupTabBarItem() {
        let profileVC: UIViewController = createNavigationController(vc: ProfileViewController(), imageName: "Profile")
        let mapVC: UIViewController =  createNavigationController(vc: MapViewController(), imageName: "Map")
        let messageVC: UIViewController = createNavigationController(vc: MessageViewController(), imageName: "Message")
        
        viewControllers = [profileVC, mapVC, messageVC]
    }
    
    func createNavigationController(vc: UIViewController, imageName: String) -> UINavigationController {
        let image = UIImage(named: imageName)
        image?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0))
        
        let tabBarItem = UITabBarItem(title: "",
                                      image: image,
                                      tag: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = tabBarItem
        return navController
    }
}
