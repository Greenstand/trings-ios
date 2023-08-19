//
//  WalkthroughPageViewController.swift
//  trings
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/08/23.
//

import UIKit

class WalkthroughPageViewController: UIViewController {

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
    
    private var guidePageConfig: WalkthroughGuideViewModel.GuidePageConfig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let guidePageConfig = self.guidePageConfig else { return }
        imageView.image = guidePageConfig.icon
        titleLabel.text = guidePageConfig.title
        infoLabel.text = guidePageConfig.info
    }
    
    func configuringView(with guidePageConfig: WalkthroughGuideViewModel.GuidePageConfig) -> WalkthroughPageViewController {
        self.guidePageConfig = guidePageConfig
        return self
    }
}
