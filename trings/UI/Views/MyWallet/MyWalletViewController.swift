//
//  MyWalletViewController.swift
//  trings
//
//  Created by Alex Cornforth on 27/10/2022.
//

import UIKit

class MyWalletViewController: UIViewController, AlertPresenting {

    @IBOutlet weak var treeCountLabel: UILabel!
    @IBOutlet weak var treeCollectionView: UICollectionView!
    @IBOutlet weak var walletCreatedLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var tokenCountLabel: UILabel!
    @IBOutlet weak var treesCountView: UIView! {
        didSet {
            treesCountView.layer.cornerRadius = 20
            treesCountView.backgroundColor = Asset.Colors.primaryGreen.color
            treesCountView.layer.opacity = 0.6
        }
    }
    @IBOutlet weak var tokensCountView: UIView! {
        didSet {
            tokensCountView.layer.cornerRadius = 20
            tokensCountView.backgroundColor = Asset.Colors.secondaryOrangeLight.color
            tokensCountView.layer.opacity = 0.6
        }
    }
    var viewModel: MyWalletViewModel? {
        didSet {
            title = viewModel?.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let banner = BannerView(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 30, height: 200))
        bannerView.addSubview(banner)
        banner.bannerImageView.image = UIImage(named: "banner")
        banner.profileImageView.image = UIImage(named: "profile")
        bannerView.addConstraint(NSLayoutConstraint(item: bannerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 225))
        profileNameLabel.text = "dadiorchen"
        walletCreatedLabel.text = "Wallet created on October 07, 2021"
        treeCollectionView.dataSource = viewModel
        treeCollectionView.delegate = self
        treeCountLabel.text = "170"
        tokenCountLabel.text = "170"
    }
}

// MARK: - Button Actions
extension MyWalletViewController {

    @IBAction private func logoutButtonPressed() {
        viewModel?.logout()
    }
}

// MARK: - MyWalletViewModelViewDelegate
extension MyWalletViewController: MyWalletViewModelViewDelegate {

    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, didReceiveError error: Error) {
        present(alert: .error(error))
    }
}
extension MyWalletViewController: UICollectionViewDelegate {

}
