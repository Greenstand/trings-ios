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
    
    @IBOutlet private weak var guidePageControl: UIPageControl! {
        didSet {
            guidePageControl.currentPageIndicatorTintColor = Asset.Colors.primaryGreen.color
            guidePageControl.pageIndicatorTintColor = Asset.Colors.grayLight.color
        }
    }
    
    @IBOutlet private weak var pageContainerView: UIView!
    
    private var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return pageViewController
    }()
    
    var viewModel: WalkthroughGuideViewModel?
    
    private var pendingIndex = 0
    private var walkthroughPages: [WalkthroughPage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupPageViewController()
        viewModel?.setupGuidePages()
        guidePageControl.numberOfPages = walkthroughPages.count
    }
    
    func setupPageViewController() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        self.addChild(pageViewController)
        pageContainerView.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: pageContainerView.leadingAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: pageContainerView.topAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: pageContainerView.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: pageContainerView.bottomAnchor)
        ])
    }
    
    func getPageIndex(of walkthroughPage: WalkthroughPage) -> Int? {
        return walkthroughPages.firstIndex(where: { $0 == walkthroughPage })
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

    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willSetupGuidePages guidePages: [WalkthroughGuideViewModel.GuidePage]) {
        guidePages.forEach { guidePage in
            let newWalkthroughPage = StoryboardScene.WalkthroughPage.initialScene.instantiate()
            newWalkthroughPage.configureView(with: guidePage)
            walkthroughPages.append(newWalkthroughPage)
        }
        
        guard let firstWalkthroughPage = walkthroughPages.first else { return }
        pageViewController.setViewControllers([firstWalkthroughPage], direction: .forward, animated: true)
    }
}

// MARK: - UIPageViewControllerDataSource
extension WalkthroughGuideViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let walkthroughPage = viewController as? WalkthroughPage,
              let index = getPageIndex(of: walkthroughPage)
        else { return nil }
        
        let previousPage = index - 1
        guard previousPage >= 0 else { return nil }
        return walkthroughPages[previousPage]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let walkthroughPage = viewController as? WalkthroughPage,
              let index = getPageIndex(of: walkthroughPage)
        else { return nil }
        
        let nextPage = index + 1
        guard nextPage < walkthroughPages.count else { return nil }
        return walkthroughPages[nextPage]
    }
}

// MARK: - UIPageViewControllerDelegate
extension WalkthroughGuideViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let firstWalkthroughPage = pendingViewControllers.first as? WalkthroughPage,
              let index = getPageIndex(of: firstWalkthroughPage)
        else { return }
        pendingIndex = index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guidePageControl.currentPage = pendingIndex
        }
    }
}
