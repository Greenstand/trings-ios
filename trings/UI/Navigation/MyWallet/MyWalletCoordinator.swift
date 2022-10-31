//
//  MyWalletCoordinator.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import UIKit

protocol MyWalletCoordinatorDelegate: AnyObject {
    func myWalletCoordinatorDidLogout(_ myWalletCoordinator: MyWalletCoordinator)
}

class MyWalletCoordinator: Coordinator {

    weak var delegate: MyWalletCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []

    let configuration: CoordinatorConfigurable

    required init(configuration: CoordinatorConfigurable) {
        self.configuration = configuration
    }

    func start() {
        showHome()
    }
}

// MARK: - Navigation
private extension MyWalletCoordinator {

    func showHome() {
        configuration.navigationController.viewControllers = [
            homeViewController
        ]
    }
}

// MARK: - View Controllers
private extension MyWalletCoordinator {

    var homeViewController: UIViewController {
        let viewController = StoryboardScene.MyWallet.initialScene.instantiate()
        viewController.viewModel = {
            let viewModel = MyWalletViewModel()
            viewModel.coordinatorDelegate = self
            viewModel.viewDelegate = viewController
            return viewModel
        }()
        return viewController
    }
}

// MARK: - MyWalletCoordinatorDelegate
extension MyWalletCoordinator: MyWalletViewModelCoordinatorDelegate {

    func myWalletViewModelDidLogOut(_ myWalletViewModel: MyWalletViewModel) {
        delegate?.myWalletCoordinatorDidLogout(self)
    }
}
