//
//  WalkthroughGuideViewController.swift
//  trings
//
//  Created by Alex Cornforth on 28/10/2022.
//

import UIKit

class WalkthroughGuideViewController: UIViewController {

    @IBOutlet private weak var guideScrollView: UIScrollView!
    @IBOutlet private weak var guidePageControl: UIPageControl!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var onTheGroundTextLabel: UILabel!
    @IBOutlet private weak var onTheGroundTitle: UILabel!
    @IBOutlet private weak var inTheCloudTextLabel: UILabel!
    @IBOutlet private weak var inTheCloudTitle: UILabel!
    @IBOutlet private weak var inYourWalletTextLabel: UILabel!
    @IBOutlet private weak var inYourWalletTitle: UILabel!
    var viewModel: WalkthroughGuideViewModel?
    var guideViews: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        guidePageControl.numberOfPages = 3
        guideScrollView.delegate = self
        viewModel?.setupGuideLabels()
    }
}


// MARK: - Button Actions
extension WalkthroughGuideViewController {

    @IBAction private func doneButtonPressed() {
        viewModel?.walkthroughComplete()
    }
}
extension WalkthroughGuideViewController: WalkthroughGuideViewModelDelegate {
    func walkthroughGuideViewController(_ walkthroughViewModel: WalkthroughGuideViewModel, willAddText texts: [String], withTitles titles: [String]) {
        onTheGroundTitle.text = titles[0]
        onTheGroundTextLabel.text = texts[0]
        inTheCloudTitle.text = titles[1]
        inTheCloudTextLabel.text = texts[1]
        inYourWalletTitle.text = titles[2]
        inYourWalletTextLabel.text = texts[2]
    }
    
    
}
extension WalkthroughGuideViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
            guidePageControl.currentPage = Int(pageNumber)
    }
    
}
