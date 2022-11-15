//
//  PurchaseTokensViewController.swift
//  trings
//
//  Created by Alex Cornforth on 27/10/2022.
//

import UIKit

class PurchaseTokensViewController: UIViewController {
    ///Still work on spacing
    ///bind the labels with the text view
    ///
    @IBOutlet weak var tokenTextField: UITextField! {
        didSet {
            tokenTextField.delegate = self
        }
    }
    var purchaseTokensViewModel: PurchaseTokensViewModel?

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var previewPuchaseButton: PrimaryButton!
    @IBOutlet weak var tokenNumberLabel: UILabel!
    @IBOutlet weak var tokenCostLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
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
        viewModel?.numberOfTokens.bind({ tokens in
            self.tokenNumberLabel.text = String(tokens)
        })
        viewModel?.totalCost.bind({ total in
            let totalString = String(format: "$%.02f", total)
            self.totalCostLabel.text = totalString
        })
        tokenTextField.addTarget(self, action: #selector(didChangeTextField), for: .editingChanged)
    }
    @IBAction func previewPurchaseButtonTapped(_ sender: Any) {
        if viewModel?.numberOfTokens.value != 0 {
            viewModel?.didSelectPreview()
        } else {
            //alert user they need to purchase a non-zero number of tokens
        }
    }
    @objc func didChangeTextField() {
        if tokenTextField.text == "" {
            viewModel?.didChangeTokens(to: 0)
        }
        guard let tokens = Int(tokenTextField.text!) else { return }
        viewModel?.didChangeTokens(to: tokens)
    }
    
}
extension PurchaseTokensViewController: PurchaseTokensViewModelDelegate {
    
}
extension PurchaseTokensViewController: UITextFieldDelegate {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
