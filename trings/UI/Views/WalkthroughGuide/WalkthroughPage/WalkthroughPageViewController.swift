//
//  WalkthroughPageViewController.swift
//  trings
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/08/23.
//

import UIKit

protocol WalkthroughPage: UIViewController {
    func configureView(with guidePage: WalkthroughGuideViewModel.GuidePage)
}

class WalkthroughPageViewController: UIViewController, WalkthroughPage {

    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet private weak var infoLabel: UILabel! {
        didSet {
            infoLabel.numberOfLines = 0
        }
    }
    
    private var guidePage: WalkthroughGuideViewModel.GuidePage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure on viewDidLoad because UIPageViewController only loads the view when showing to the user. 
        guard let guidePageConfig = self.guidePage else { return }
        imageView.image = guidePageConfig.icon
        titleLabel.text = guidePageConfig.title
        infoLabel.text = guidePageConfig.info
    }
    
    func configureView(with guidePage: WalkthroughGuideViewModel.GuidePage) {
        self.guidePage = guidePage
    }
}
