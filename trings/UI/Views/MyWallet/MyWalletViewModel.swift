//
//  MyWalletViewModel.swift
//  trings
//
//  Created by Alex Cornforth on 27/10/2022.
//

import Foundation
import UIKit

protocol MyWalletViewModelCoordinatorDelegate: AnyObject {
    func myWalletViewModelDidLogOut(_ myWalletViewModel: MyWalletViewModel)
}

protocol MyWalletViewModelViewDelegate: AnyObject {
    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, didReceiveError error: Error)
}

class MyWalletViewModel: NSObject {

    weak var coordinatorDelegate: MyWalletViewModelCoordinatorDelegate?
    weak var viewDelegate: MyWalletViewModelViewDelegate?
    var title = "Wallet"
    var trees = [UIImage(named: "tree1"), UIImage(named: "tree2"), UIImage(named: "tree3"), UIImage(named: "tree4")]
    func logout() {
        coordinatorDelegate?.myWalletViewModelDidLogOut(self)
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

