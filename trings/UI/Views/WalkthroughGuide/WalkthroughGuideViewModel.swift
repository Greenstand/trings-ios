//
//  WalkthroughGuideViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 28/10/2022.
//

import Foundation
import UIKit

protocol WalkthroughGuideViewModelCoordinatorDelegate: AnyObject {
    func walkthroughGuideViewModelDidCompleteWalkthrough(_ walkthroughGuideViewModel: WalkthroughGuideViewModel)
}
protocol WalkthroughGuideViewModelDelegate: AnyObject {
    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willAddText texts: [String], withTitles titles: [String])
}

class WalkthroughGuideViewModel {
    weak var viewDelegate: WalkthroughGuideViewModelDelegate?
    weak var coordinatorDelegate: WalkthroughGuideViewModelCoordinatorDelegate?
    let guideTexts = [L10n.OnTheGround.text, L10n.InTheCloud.text, L10n.InYourWallet.text]
    let guideTitles = ["On the Ground", "In the Cloud", "In Your Wallet"]


    func walkthroughComplete() {
        coordinatorDelegate?.walkthroughGuideViewModelDidCompleteWalkthrough(self)
    }
    func setupGuideLabels() {
        viewDelegate?.walkthroughGuideViewController(self, willAddText: guideTexts, withTitles: guideTitles)
    }
}
extension WalkthroughGuideViewModel {
    
}
