import UIKit

final class RestorePasswordCoordinator : Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let restorePasswordController = RestorePasswordController(restorePasswordViewModel: RestorePasswordViewModel())
        //loginViewController.loginCoordinator = LoginCoordinator(navigationController: navigationController)
        navigationController.pushViewController(restorePasswordController, animated: true)
    }
}
