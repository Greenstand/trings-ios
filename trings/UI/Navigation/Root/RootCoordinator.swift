//
//  RootCoordinator.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import UIKit

class RootCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    let configuration: CoordinatorConfigurable

    required init(configuration: CoordinatorConfigurable) {
        self.configuration = configuration
    }

    func start() {
        //showHome()
        showSignIn()
    }
}


// MARK: - Navigation
private extension RootCoordinator {

    func showLoadingViewController() {
        // Currently we don't use the loading view.
        // Lets keep it though for future use.
        configuration.navigationController.viewControllers = [
            loadingViewController
        ]
    }

    func showSignIn() {
        startCoordinator(coordinator: authenticationCoordinator)
    }

    func showHome() {
        startCoordinator(coordinator: myWalletCoordinator)
    }
}

// MARK: - View Controllers
private extension RootCoordinator {

    var loadingViewController: UIViewController {
        return UIViewController()
    }
}

// MARK: - Child Coordinators
private extension RootCoordinator {

    var authenticationCoordinator: Coordinator {
        let authenticationCoordinator = AuthenticationCoordinator(
            configuration: configuration
        )
        authenticationCoordinator.delegate = self
        return authenticationCoordinator
    }

    var myWalletCoordinator: Coordinator {
        let homeCoordinator = MyWalletCoordinator(
            configuration: configuration
        )
        homeCoordinator.delegate = self
        return homeCoordinator
    }
}

// MARK: - AuthenticationCoordinatorDelegate
extension RootCoordinator: AuthenticationCoordinatorDelegate {
    func authenticationCoordinator(_ signInCoordinator: AuthenticationCoordinator, didSignInWallet wallet: String) {
        childCoordinators.removeAll()
        showHome()
    }

    func authenticationCoordinator(_ signInCoordinator: AuthenticationCoordinator, didCreateWallet wallet: String) {
        childCoordinators.removeAll()
        showHome()
    }
}

// MARK: - HomeCoordinatorDelegate
extension RootCoordinator: MyWalletCoordinatorDelegate {

    func myWalletCoordinatorDidLogout(_ myWalletCoordinator: MyWalletCoordinator) {
        childCoordinators.removeAll()
        showSignIn()
    }
}
