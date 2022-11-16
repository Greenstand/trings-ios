//
//  PurchaseTokensViewController.swift
//  trings
//
//  Created by Alex Cornforth on 27/10/2022.
//

import UIKit

class PurchaseTokensViewController: UIViewController {
    @IBOutlet private weak var tokenTextField: UITextField! {
        didSet {
            tokenTextField.delegate = self
        }
    }
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var previewPuchaseButton: PrimaryButton!
    @IBOutlet private weak var tokenNumberLabel: UILabel!
    @IBOutlet private weak var tokenCostLabel: UILabel!
    @IBOutlet private weak var totalCostLabel: UILabel!
    var viewModel: PurchaseTokensViewModel? {
        didSet {
            viewModel?.viewDelegate = self
            title = viewModel?.title
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        tokenTextField.addTarget(self, action: #selector(didChangeTextField), for: .editingChanged)
    }
}
// MARK: - Button Actions
extension PurchaseTokensViewController {
    @IBAction func previewPurchaseButtonTapped(_ sender: Any) {
        if viewModel?.numberOfTokens != 0 {
            viewModel?.didSelectPreview()
        } else {
            //alert user they need to purchase a non-zero number of tokens
        }
    }
}
extension PurchaseTokensViewController: PurchaseTokensViewModelDelegate {
    func purchaseTokensViewModel(_ purchaseTokensViewModel: PurchaseTokensViewModel, didChangeTokensNumber tokens: Int, didChangeTotalCost total: Double) {
        tokenNumberLabel.text = String(tokens)
        totalCostLabel.text = String(format: "$%.2f", total)
    }  
}
extension PurchaseTokensViewController: UITextFieldDelegate {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc private func didChangeTextField() {
        if tokenTextField.text == "" {
            viewModel?.didChangeTokens(to: 0)
        }
        guard let tokens = Int(tokenTextField.text!) else { return }
        viewModel?.didChangeTokens(to: tokens)
    }
}
