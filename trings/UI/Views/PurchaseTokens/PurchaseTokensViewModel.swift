//
//  PurchaseTokensViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 27/10/2022.
//

import Foundation

protocol PurchaseTokensViewModelCoordinatorDelegate: AnyObject {
    func purchaseTokensViewModel(_ purchaseTokensViewModel: PurchaseTokensViewModel, didSelectPreviewPurchaseOf tokensNumber: Int)
}
protocol PurchaseTokensViewModelDelegate: AnyObject {
    func purchaseTokensViewModel(_ purchaseTokensViewModel: PurchaseTokensViewModel, didChangeTokensNumber tokens: Int, didChangeTotalCost total: Double)
}
class PurchaseTokensViewModel {
    weak var coordinatorDelegate: PurchaseTokensViewModelCoordinatorDelegate?
    weak var viewDelegate: PurchaseTokensViewModelDelegate?
    var title = "Purchase Tokens"
    var numberOfTokens: Int = 0
    var totalCost: Double = 0
    var costPerToken: Double = 1
    func didChangeTokens(to tokens: Int) {
        numberOfTokens = tokens
        totalCost = Double(tokens) * costPerToken
        viewDelegate?.purchaseTokensViewModel(self, didChangeTokensNumber: numberOfTokens, didChangeTotalCost: totalCost)
    }
    func didSelectPreview() {
        coordinatorDelegate?.purchaseTokensViewModel(self, didSelectPreviewPurchaseOf: numberOfTokens)
    }
}
