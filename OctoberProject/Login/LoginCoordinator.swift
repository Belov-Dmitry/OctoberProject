import Foundation
import UIKit

final class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = TabBarController()
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
