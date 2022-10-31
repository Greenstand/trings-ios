//
//  WalkthroughGuideViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 28/10/2022.
//

import Foundation

protocol WalkthroughGuideViewModelCoordinatorDelegate: AnyObject {
    func walkthroughGuideViewModelDidCompleteWalkthrough(_ walkthroughGuideViewModel: WalkthroughGuideViewModel)
}

class WalkthroughGuideViewModel {

    weak var coordinatorDelegate: WalkthroughGuideViewModelCoordinatorDelegate?

    func walkthroughComplete() {
        coordinatorDelegate?.walkthroughGuideViewModelDidCompleteWalkthrough(self)
    }
}
