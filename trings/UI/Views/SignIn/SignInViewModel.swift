//
//  SignInViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import Foundation

protocol SignInViewModelCoordinatorDelegate: AnyObject {
    func signInViewModel(_ signInViewModel: SignInViewModel, didSignInWallet name: String)
    func signInViewModel(_ signInViewModel: SignInViewModel, didCreateWallet name: String)
}

protocol SignInViewModelViewDelegate: AnyObject {
    func signInViewModel(_ signInViewModel: SignInViewModel, didReceiveError error: Error)
    func signInViewModel(_ signInViewModel: SignInViewModel, didUpdateSignInEnabled enabled: Bool)
}

class SignInViewModel {

    weak var coordinatorDelegate: SignInViewModelCoordinatorDelegate?
    weak var viewDelegate: SignInViewModelViewDelegate?

    private var walletName: String = "" {
        didSet {
            viewDelegate?.signInViewModel(self, didUpdateSignInEnabled: walletNameValid)
        }
    }

    func signInWallet() {
        coordinatorDelegate?.signInViewModel(self, didSignInWallet: walletName)
    }

    func createWallet() {
        coordinatorDelegate?.signInViewModel(self, didCreateWallet: walletName)
    }

    func updateWalletName(name: String) {
        walletName = name
    }

    private var walletNameValid: Bool {
        return walletName.count > 0
    }
}
