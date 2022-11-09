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
    
}
class PurchaseTokensViewModel {
    weak var coordinatorDelegate: PurchaseTokensViewModelCoordinatorDelegate?
    weak var viewDelegate: PurchaseTokensViewModelDelegate?
    var title = "Purchase Tokens"
    var numberOfTokens: Observable<Int> = Observable(0)
    var totalCost: Observable<Double> = Observable(0)
    var costPerToken: Double = 1
    func didChangeTokens(to tokens: Int) {
        numberOfTokens.value = tokens
        totalCost.value = Double(tokens) * costPerToken
    }
    func didSelectPreview() {
        coordinatorDelegate?.purchaseTokensViewModel(self, didSelectPreviewPurchaseOf: numberOfTokens.value)
    }
}
