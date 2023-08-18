//
//  WalkthroughGuideViewController.swift
//  trings
//
//  Created by Alex Cornforth on 28/10/2022.
//

import UIKit

class WalkthroughGuideViewController: UIViewController {

    @IBOutlet private weak var doneButton: UIButton! {
        didSet {
            doneButton.setTitle(L10n.Walkthrough.ContinueButton.title, for: .normal)
        }
    }

    var viewModel: WalkthroughGuideViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.setupGuideLabels()
    }
}

// MARK: - Button Actions
extension WalkthroughGuideViewController {

    @IBAction private func doneButtonPressed() {
        self.dismiss(animated: true)
    }
}

// MARK: - WalkthroughGuideViewModelDelegate
extension WalkthroughGuideViewController: WalkthroughGuideViewModelDelegate {

    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willAddPages pages: [WalkthroughGuideViewModel.GuidePage]) {

    }

    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willAddText texts: [String], withTitles titles: [String]) {
        
    }
}
