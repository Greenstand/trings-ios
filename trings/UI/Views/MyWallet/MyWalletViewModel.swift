//
//  MyWalletViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 27/10/2022.
//

import Foundation

protocol MyWalletViewModelCoordinatorDelegate: AnyObject {
    func myWalletViewModelDidLogOut(_ myWalletViewModel: MyWalletViewModel)
}

protocol MyWalletViewModelViewDelegate: AnyObject {
    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, didReceiveError error: Error)
}

class MyWalletViewModel {

    weak var coordinatorDelegate: MyWalletViewModelCoordinatorDelegate?
    weak var viewDelegate: MyWalletViewModelViewDelegate?

    func logout() {
        coordinatorDelegate?.myWalletViewModelDidLogOut(self)
    }
}
