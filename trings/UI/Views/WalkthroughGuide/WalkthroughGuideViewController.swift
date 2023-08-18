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

    @IBOutlet private weak var pageContainerView: UIView!
    
    private var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return pageViewController
    }()
    
    var viewModel: WalkthroughGuideViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        viewModel?.setupFirstPage()
    }
    
    func setupPageViewController() {
        pageViewController.dataSource = self
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
}

// MARK: - Button Actions
extension WalkthroughGuideViewController {

    @IBAction private func doneButtonPressed() {
        self.dismiss(animated: true)
    }
}

// MARK: - WalkthroughGuideViewModelDelegate
extension WalkthroughGuideViewController: WalkthroughGuideViewModelDelegate {

    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willAddFirstPage page: UIViewController) {
        pageViewController.setViewControllers([page], direction: .forward, animated: true)
    }
}

// MARK: - UIPageViewControllerDataSource
extension WalkthroughGuideViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return viewModel?.getPage(before: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return viewModel?.getPage(after: viewController)
    }
}
