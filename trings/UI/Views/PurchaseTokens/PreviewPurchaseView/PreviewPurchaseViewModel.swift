//
//  PrieviewPurchaseViewModel.swift
//  trings
//
//  Created by Robert Huber on 11/8/22.
//

import Foundation
protocol PreviewPurchaseViewModelCoordinatorDelegate: AnyObject {
    
}
protocol PreviewPurchaseViewModelDelegate: AnyObject {
    func previewPurchaseViewModel(_ previewPurchaseViewModel: PreviewPurchaseViewModel, willPurchaseTokens tokens: Int, atCost cost: Double, forWallet walletName: String)
    
}
class PreviewPurchaseViewModel {
    weak var coordinatorDelegate: PreviewPurchaseViewModelCoordinatorDelegate?
    weak var viewDelegate: PreviewPurchaseViewModelDelegate?
    var tokens: Int = 0
    var costPerToken: Double = 1.0
    var wallet = "My Wallet"
    func presentPuchasePreview() {
        viewDelegate?.previewPurchaseViewModel(self, willPurchaseTokens: tokens, atCost: costPerToken, forWallet: wallet)
    }
}
