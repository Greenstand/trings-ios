//
//  MyWalletViewController.swift
//  trings
//
//  Created by Alex Cornforth on 27/10/2022.
//

import UIKit

class MyWalletViewController: UIViewController, AlertPresenting {

    var viewModel: MyWalletViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Button Actions
extension MyWalletViewController {

    @IBAction private func logoutButtonPressed() {
        viewModel?.logout()
    }
}

// MARK: - MyWalletViewModelViewDelegate
extension MyWalletViewController: MyWalletViewModelViewDelegate {

    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, didReceiveError error: Error) {
        present(alert: .error(error))
    }
}
