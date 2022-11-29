//
//  MyWalletViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 27/10/2022.
//

import Foundation
import UIKit
import GreenstandWalletSDK

protocol MyWalletViewModelCoordinatorDelegate: AnyObject {
    func myWalletViewModelDidLogOut(_ myWalletViewModel: MyWalletViewModel)
    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, didSelectTreeMapView trees: [Tree])
    func myWalletViewModelDidSelectPurchaseTokens(_ myWalletViewModel: MyWalletViewModel)
}

protocol MyWalletViewModelViewDelegate: AnyObject {
    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, didReceiveError error: Error)
}

class MyWalletViewModel: NSObject {
    weak var coordinatorDelegate: MyWalletViewModelCoordinatorDelegate?
    weak var viewDelegate: MyWalletViewModelViewDelegate?
    var title = "Wallet"
    var trees = [UIImage(named: "tree1"), UIImage(named: "tree2"), UIImage(named: "tree3"), UIImage(named: "tree4")]
    private func fetchWallet() {
        GreenstandWalletSDK.shared.myWallet { result in
            switch result {
            case .success(let wallet):
                print(wallet)
            case .failure(let error):
                print(error)
            }
        }
    }
    func logout() {
        coordinatorDelegate?.myWalletViewModelDidLogOut(self)
    }
    func showTreeMapView() {
        coordinatorDelegate?.myWalletViewModel(self, didSelectTreeMapView: TestTrees.getTestTrees(170))
    }
    func showPurchaseView() {
        coordinatorDelegate?.myWalletViewModelDidSelectPurchaseTokens(self)
    }
}
extension MyWalletViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trees.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TreeCell", for: indexPath) as? TreeCollectionViewCell else { return UICollectionViewCell()}
        cell.treeCellImageView.image = trees[indexPath.row]
        cell.treeCellLabel.text = "Tree - \(indexPath.row)"
        return cell
    }
}

