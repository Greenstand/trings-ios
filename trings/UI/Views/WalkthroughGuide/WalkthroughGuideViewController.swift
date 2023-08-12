//
//  WalkthroughGuideViewController.swift
//  trings
//
//  Created by Alex Cornforth on 28/10/2022.
//

import UIKit

class WalkthroughGuideViewController: UIViewController {

    @IBOutlet private weak var guideScrollView: UIScrollView! {
        didSet {
            guideScrollView.delegate = self
        }
    }
    @IBOutlet private weak var guidePageControl: UIPageControl! {
        didSet {
            guidePageControl.numberOfPages = 0
            guidePageControl.currentPageIndicatorTintColor = Asset.Colors.primaryGreen.color
            guidePageControl.pageIndicatorTintColor = Asset.Colors.grayLight.color
        }
    }
    @IBOutlet private weak var doneButton: UIButton! {
        didSet {
            doneButton.setTitle(L10n.Walkthrough.ContinueButton.title, for: .normal)
        }
    }

    @IBOutlet private weak var onTheGroundTextLabel: UILabel! {
        didSet {
            onTheGroundTextLabel.numberOfLines = 0
        }
    }
    @IBOutlet private weak var onTheGroundTitle: UILabel! {
        didSet {
            onTheGroundTitle.numberOfLines = 0
        }
    }
    @IBOutlet private weak var onTheGroundImage: UIImageView!

    @IBOutlet private weak var inTheCloudTextLabel: UILabel! {
        didSet {
            inTheCloudTextLabel.numberOfLines = 0
        }
    }
    @IBOutlet private weak var inTheCloudTitle: UILabel! {
        didSet {
            inTheCloudTitle.numberOfLines = 0
        }
    }
    @IBOutlet private weak var inTheCloudImage: UIImageView!

    @IBOutlet private weak var inYourWalletTextLabel: UILabel! {
        didSet {
            inYourWalletTextLabel.numberOfLines = 0
        }
    }
    @IBOutlet private weak var inYourWalletTitle: UILabel! {
        didSet {
            inYourWalletTitle.numberOfLines = 0
        }
    }
    @IBOutlet private weak var inYourWalletImage: UIImageView!

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

        guidePageControl.numberOfPages = pages.count

        onTheGroundTitle.text = pages[0].title
        onTheGroundTextLabel.text = pages[0].info
        onTheGroundImage.image = pages[0].icon

        inTheCloudTitle.text = pages[1].title
        inTheCloudTextLabel.text = pages[1].info
        inTheCloudImage.image = pages[1].icon

        inYourWalletTitle.text = pages[2].title
        inYourWalletTextLabel.text = pages[2].info
        inYourWalletImage.image = pages[2].icon

    }

    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willAddText texts: [String], withTitles titles: [String]) {
        onTheGroundTitle.text = titles[0]
        onTheGroundTextLabel.text = texts[0]
        inTheCloudTitle.text = titles[1]
        inTheCloudTextLabel.text = texts[1]
        inYourWalletTitle.text = titles[2]
        inYourWalletTextLabel.text = texts[2]
    }
}

// MARK: - UIScrollViewDelegate
extension WalkthroughGuideViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
            guidePageControl.currentPage = Int(pageNumber)
    }
}
