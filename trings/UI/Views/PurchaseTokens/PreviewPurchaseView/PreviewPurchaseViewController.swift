//
//  PreviewPurchaseViewController.swift
//  trings
//
//  Created by Robert Huber on 11/8/22.
//

import UIKit

class PreviewPurchaseViewController: UIViewController {

    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var costPerTokenLabel: UILabel!
    @IBOutlet weak var walletNameLabel: UILabel!
    @IBOutlet weak var numberOfTokensLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    var viewModel: PreviewPurchaseViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        viewModel?.tokens.bind({ [unowned self] tokenNumber in
            self.numberOfTokensLabel.text = String(tokenNumber) + " Tokens"
            let total: Double = Double(tokenNumber) * (self.viewModel?.costPerToken ?? 1)
            self.totalCostLabel.text = String(format: "$%.02f", total)
        })
        costPerTokenLabel.text = "$1.00"
        walletNameLabel.text = "My Wallet"
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.insertSubview(blurEffectView, at: 0)
    }
    @IBAction func purchaseButtonTapped(_ sender: Any) {
    }
}
extension PreviewPurchaseViewController: PurchaseTokensViewModelDelegate {
    
}
