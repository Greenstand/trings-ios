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
        //showHome()
        //showGuide()
        showPurchase()
    }
}

// MARK: - Navigation
private extension MyWalletCoordinator {

    func showHome() {
        configuration.navigationController.viewControllers = [
            homeViewController
        ]
    }
    func showGuide() {
        configuration.navigationController.viewControllers = [walkthroughGuideViewController]
    }
    func showPurchase() {
        configuration.navigationController.pushViewController(purchaseTokensViewController, animated: true)
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
    var walkthroughGuideViewController: UIViewController {
        let viewController = StoryboardScene.WalkthroughGuide.initialScene.instantiate()
        viewController.viewModel = {
            let viewModel = WalkthroughGuideViewModel()
            viewModel.coordinatorDelegate = self
            viewModel.viewDelegate = viewController
            return viewModel
        }()
        return viewController
    }
    var purchaseTokensViewController: PurchaseTokensViewController {
        let viewController = StoryboardScene.PurchaseTokens.initialScene.instantiate()
        viewController.viewModel = {
            let viewModel = PurchaseTokensViewModel()
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
extension MyWalletCoordinator: WalkthroughGuideViewModelCoordinatorDelegate {
    func walkthroughGuideViewModelDidCompleteWalkthrough(_ walkthroughGuideViewModel: WalkthroughGuideViewModel) {
        showHome()
    }
}
extension MyWalletCoordinator: PurchaseTokensViewModelCoordinatorDelegate {
    func purchaseTokensViewModel(_ purchaseTokensViewModel: PurchaseTokensViewModel, didSelectPreviewPurchaseOf tokensNumber: Int) {
        presentPreviewPurchaseView(withTokens: tokensNumber)
    }
    
}
extension MyWalletCoordinator: PreviewPurchaseViewModelCoordinatorDelegate {
    func presentPreviewPurchaseView(withTokens tokens: Int) {
        var previewPurchaseViewController: PreviewPurchaseViewController {
            let viewController = StoryboardScene.PreviewPurchaseView.initialScene.instantiate()
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.viewModel = {
                let viewModel = PreviewPurchaseViewModel()
                viewModel.coordinatorDelegate = self
                viewModel.viewDelegate = viewController
                viewModel.tokens.value = tokens
                return viewModel
            }()
            return viewController
        }
        previewPurchaseViewController.modalPresentationStyle = .overCurrentContext
        configuration.navigationController.present(previewPurchaseViewController, animated: true)
    }
}
