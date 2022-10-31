//
//  WalkthroughGuideViewController.swift
//  trings
//
//  Created by Alex Cornforth on 28/10/2022.
//

import UIKit

class WalkthroughGuideViewController: UIViewController {

    var viewModel: WalkthroughGuideViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - Button Actions
extension WalkthroughGuideViewController {

    @IBAction private func doneButtonPressed() {
        viewModel?.walkthroughComplete()
    }
}
