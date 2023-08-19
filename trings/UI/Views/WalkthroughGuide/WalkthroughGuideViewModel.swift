//
//  WalkthroughGuideViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 28/10/2022.
//

import Foundation
import UIKit

protocol WalkthroughGuideViewModelDelegate: AnyObject {
    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willAddFirstPage page: UIViewController)
}

class WalkthroughGuideViewModel {
    weak var viewDelegate: WalkthroughGuideViewModelDelegate?
    
    private let guidePages: [UIViewController] = [
        StoryboardScene.WalkthroughPage.initialScene.instantiate()
            .configuringView(with: GuidePageConfig(title: L10n.Walkthrough.OnTheGround.title, info: L10n.Walkthrough.OnTheGround.info, icon: Asset.Assets.circleLeaf.image)),
        StoryboardScene.WalkthroughPage.initialScene.instantiate()
            .configuringView(with: GuidePageConfig(title: L10n.Walkthrough.InTheCloud.title, info: L10n.Walkthrough.InTheCloud.info, icon: Asset.Assets.circleBulb.image)),
        StoryboardScene.WalkthroughPage.initialScene.instantiate()
            .configuringView(with: GuidePageConfig(title: L10n.Walkthrough.InYourWallet.title, info: L10n.Walkthrough.InYourWallet.info, icon: Asset.Assets.circleCoin.image))
    ]
    
    func setupGuidePages() {
        guard let firstPage = guidePages.first else { return }
        viewDelegate?.walkthroughGuideViewController(self, willAddFirstPage: firstPage)
    }
    
    func getPage(before viewController: UIViewController) -> UIViewController? {
        guard let index = (guidePages as [UIViewController]).firstIndex(of: viewController) else { return nil }
        let previousPage = index - 1
        guard previousPage >= 0 else { return nil }
        return guidePages[previousPage]
    }
    
    func getPage(after viewController: UIViewController) -> UIViewController? {
        guard let index = (guidePages as [UIViewController]).firstIndex(of: viewController) else { return nil }
        let nextPage = index + 1
        guard nextPage < guidePages.count else { return nil }
        return guidePages[nextPage]
    }
    
    func getIndex(of viewController: UIViewController) -> Int? {
        return (guidePages as [UIViewController]).firstIndex(of: viewController)
    }
    
    func getTotalNumberOfPages() -> Int {
        guidePages.count
    }
}

extension WalkthroughGuideViewModel {

    struct GuidePageConfig {
        let title: String
        let info: String
        let icon: UIImage
    }
}
