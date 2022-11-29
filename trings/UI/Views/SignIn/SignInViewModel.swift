//
//  SignInViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import Foundation
import GreenstandWalletSDK

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
    var title = "Wallet SignIn"
    private var password: String = "" {
        didSet{
            if walletNameValid {
                viewDelegate?.signInViewModel(self, didUpdateSignInEnabled: passwordValid)
            }
        }
    }
    private var walletName: String = "" {
        didSet {
            if passwordValid {
                viewDelegate?.signInViewModel(self, didUpdateSignInEnabled: walletNameValid)
            }
        }
    }
    
    func signInWallet() {
        GreenstandWalletSDK.shared.signInWallet(walletName: walletName, password: password) { result in
            switch result {
            case .success(let name):
                self.coordinatorDelegate?.signInViewModel(self, didSignInWallet: name)
            case .failure(let error):
                self.viewDelegate?.signInViewModel(self, didReceiveError: error)
            }
        }
        
    }

    func createWallet() {
        GreenstandWalletSDK.shared.createWallet(walletName: walletName, password: password) { result in
            switch result {
            case .success(let name):
                self.coordinatorDelegate?.signInViewModel(self, didCreateWallet: name)
            case .failure(let error):
                self.viewDelegate?.signInViewModel(self, didReceiveError: error)
            }
        }
        coordinatorDelegate?.signInViewModel(self, didCreateWallet: walletName)
    }

    func updateWalletName(name: String) {
        walletName = name
    }
    func updatePassword(password: String) {
        self.password = password
    }

    private var walletNameValid: Bool {
        return walletName.count > 0
    }
    private var passwordValid: Bool {
        return password.count > 0
    }
}
