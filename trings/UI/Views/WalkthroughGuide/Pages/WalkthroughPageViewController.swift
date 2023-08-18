//
//  WalkthroughPageViewController.swift
//  trings
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/08/23.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController  {
    
    let pages = [
        StoryboardScene.FirstWalkthroughPage.initialScene.instantiate(),
        StoryboardScene.SecondWalkthroughPage.initialScene.instantiate(),
        StoryboardScene.ThirdWalkthroughPage.initialScene.instantiate()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        guard let firstPage = pages.first else { return }
        self.setViewControllers([firstPage], direction: .forward, animated: true)
    }

}

extension WalkthroughPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        let previousPage = index - 1
        guard previousPage >= 0 else { return nil }
        return pages[previousPage]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        let nextPage = index + 1
        guard nextPage < pages.count else { return nil }
        return pages[nextPage]
    }
}
