//
//  PreviewPurchaseViewController.swift
//  trings
//
//  Created by Robert Huber on 11/8/22.
//

import UIKit

class PreviewPurchaseViewController: UIViewController, AlertPresenting {

    @IBOutlet private weak var totalCostLabel: UILabel!
    @IBOutlet private weak var costPerTokenLabel: UILabel!
    @IBOutlet private weak var walletNameLabel: UILabel!
    @IBOutlet private weak var numberOfTokensLabel: UILabel!
    @IBOutlet private weak var stackView: UIStackView!
    var viewModel: PreviewPurchaseViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurEffectView, at: 0)
        viewModel?.presentPuchasePreview()
    }
}
//MARK: - Button Actions
extension PreviewPurchaseViewController {
    @IBAction func purchaseButtonTapped(_ sender: Any) {
    }
}
extension PreviewPurchaseViewController: PreviewPurchaseViewModelDelegate {
    func previewPurchaseViewModel(_ previewPurchaseViewModel: PreviewPurchaseViewModel, didRecieveError error: Error) {
        present(alert: .error(error))
    }
    
    func previewPurchaseViewModel(_ previewPurchaseViewModel: PreviewPurchaseViewModel, willPurchaseTokens tokens: Int, atCost cost: Double, forWallet walletName: String) {
        numberOfTokensLabel.text = String(tokens)
        costPerTokenLabel.text = String(format: "$%.2f", cost)
        walletNameLabel.text = walletName
        var total = Double(tokens) * cost
        totalCostLabel.text = String(format: "$%.2f", total)
    }
    
}

