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
    
    private let guidePages = [
        StoryboardScene.FirstWalkthroughPage.initialScene.instantiate(),
        StoryboardScene.SecondWalkthroughPage.initialScene.instantiate(),
        StoryboardScene.ThirdWalkthroughPage.initialScene.instantiate()
    ]
    
    func setupFirstPage() {
        guard let firstPage = guidePages.first else { return }
        viewDelegate?.walkthroughGuideViewController(self, willAddFirstPage: firstPage)
    }
    
    func getPage(before viewController: UIViewController) -> UIViewController? {
        guard let index = guidePages.firstIndex(of: viewController) else { return nil }
        let previousPage = index - 1
        guard previousPage >= 0 else { return nil }
        return guidePages[previousPage]
    }
    
    func getPage(after viewController: UIViewController) -> UIViewController? {
        guard let index = guidePages.firstIndex(of: viewController) else { return nil }
        let nextPage = index + 1
        guard nextPage < guidePages.count else { return nil }
        return guidePages[nextPage]
    }
}
