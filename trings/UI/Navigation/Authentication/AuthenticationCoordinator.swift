//
//  AuthenticationCoordinator.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import UIKit

protocol AuthenticationCoordinatorDelegate: AnyObject {
    func authenticationCoordinator(_ signInCoordinator: AuthenticationCoordinator, didSignInWallet wallet: String)
    func authenticationCoordinator(_ signInCoordinator: AuthenticationCoordinator, didCreateWallet wallet: String)
}

class AuthenticationCoordinator: Coordinator {

    weak var delegate: AuthenticationCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    let configuration: CoordinatorConfigurable

    required init(configuration: CoordinatorConfigurable) {
        self.configuration = configuration
    }

    func start() {
        showInitialSignIn()
    }
}

// MARK: - Navigation
private extension AuthenticationCoordinator {

    func showInitialSignIn() {
        configuration.navigationController.viewControllers = [
            signInViewController
        ]
    }

    func showWalkthroughGuide() {
        configuration.navigationController.present(walkthroughViewController, animated: true)
    }
}

// MARK: - View Controllers
private extension AuthenticationCoordinator {

    var signInViewController: UIViewController {
        let viewController = StoryboardScene.SignIn.initialScene.instantiate()
        viewController.viewModel = {
            let viewModel = SignInViewModel()
            viewModel.viewDelegate = viewController
            viewModel.coordinatorDelegate = self
            return viewModel
        }()
        return viewController
    }

    var walkthroughViewController: UIViewController {
        let viewController = StoryboardScene.WalkthroughGuide.initialScene.instantiate()
        viewController.viewModel = {
            let viewModel = WalkthroughGuideViewModel()
            viewModel.viewDelegate = viewController
            return viewModel
        }()
        return viewController
    }
}

// MARK: - SignInViewModelCoordinatorDelegate
extension AuthenticationCoordinator: SignInViewModelCoordinatorDelegate {

    func signInViewModel(_ signInViewModel: SignInViewModel, didSignInWallet name: String) {
        delegate?.authenticationCoordinator(self, didSignInWallet: name)
    }

    func signInViewModel(_ signInViewModel: SignInViewModel, didCreateWallet name: String) {
        delegate?.authenticationCoordinator(self, didCreateWallet:  name)
        showWalkthroughGuide()
    }
}
