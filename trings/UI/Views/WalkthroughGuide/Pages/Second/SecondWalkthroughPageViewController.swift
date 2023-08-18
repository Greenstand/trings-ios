//
//  SecondWalkthroughPageViewController.swift
//  trings
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/08/23.
//

import UIKit

class SecondWalkthroughPageViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            imageView.image = Asset.Assets.circleBulb.image
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
            titleLabel.text = L10n.Walkthrough.InTheCloud.title
        }
    }
    
    @IBOutlet private weak var textLabel: UILabel! {
        didSet {
            textLabel.numberOfLines = 0
            textLabel.text = L10n.Walkthrough.InTheCloud.info
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
