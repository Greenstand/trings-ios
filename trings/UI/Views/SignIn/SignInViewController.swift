//
//  SignInViewController.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import UIKit

class SignInViewController: UIViewController, AlertPresenting {

    @IBOutlet private var walletNameField: UITextField! {
        didSet {
            walletNameField.delegate = self
            walletNameField.placeholder = L10n.SignIn.TextInput.WalletName.placeholder
        }
    }
    @IBOutlet private var signInButton: PrimaryButton! {
        didSet {
            signInButton.setTitle(L10n.SignIn.SignInButton.title, for: .normal)
            signInButton.isEnabled = false
        }
    }
    @IBOutlet private var createWalletButton: PrimaryButton! {
        didSet {
            createWalletButton.setTitle(L10n.SignIn.CreateWalletButton.title, for: .normal)
            createWalletButton.isEnabled = false
        }
    }

    var viewModel: SignInViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Greenstand Wallet"
    }
}

// MARK: - Button Actions
extension SignInViewController {

    @IBAction private func signInButtonPressed() {
        viewModel?.signInWallet()
    }

    @IBAction private func createWalletButtonPressed() {
        viewModel?.createWallet()
    }
}

// MARK: - TextField Delegate
extension SignInViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text as NSString? else {
            return true
        }

        let newText = text.replacingCharacters(in: range, with: string)
        viewModel?.updateWalletName(name: newText)
        return true
    }
}

// MARK: - SignInViewModelViewDelegate
extension SignInViewController: SignInViewModelViewDelegate {

    func signInViewModel(_ signInViewModel: SignInViewModel, didReceiveError error: Error) {
        present(alert: .error(error))
    }

    func signInViewModel(_ signInViewModel: SignInViewModel, didUpdateSignInEnabled enabled: Bool) {
        signInButton.isEnabled = enabled
        createWalletButton.isEnabled = enabled
    }
}
