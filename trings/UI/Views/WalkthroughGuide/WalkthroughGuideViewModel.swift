//
//  WalkthroughGuideViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 28/10/2022.
//

import Foundation
import UIKit

protocol WalkthroughGuideViewModelDelegate: AnyObject {
    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willSetupGuidePages guidePages: [WalkthroughGuideViewModel.GuidePage])
}

class WalkthroughGuideViewModel {
    weak var viewDelegate: WalkthroughGuideViewModelDelegate?
    
    private var guidePages: [GuidePage] {
        [
            GuidePage(title: L10n.Walkthrough.OnTheGround.title, info: L10n.Walkthrough.OnTheGround.info, icon: Asset.Assets.circleLeaf.image),
            GuidePage(title: L10n.Walkthrough.InTheCloud.title, info: L10n.Walkthrough.InTheCloud.info, icon: Asset.Assets.circleBulb.image),
            GuidePage(title: L10n.Walkthrough.InYourWallet.title, info: L10n.Walkthrough.InYourWallet.info, icon: Asset.Assets.circleCoin.image)
        ]
    }
    
    func setupGuidePages() {
        viewDelegate?.walkthroughGuideViewController(self, willSetupGuidePages: guidePages)
    }
}

extension WalkthroughGuideViewModel {

    struct GuidePage {
        let title: String
        let info: String
        let icon: UIImage
    }
}
