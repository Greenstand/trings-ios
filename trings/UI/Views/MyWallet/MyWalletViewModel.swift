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
    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, willUpdateProfileName profileName: String)
    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, willUpdateBannerImage bannerImage: UIImage?)
    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, willUpdateProfileImage profileImage: UIImage?)
    func myWalletViewModel(_ myWalletViewModel: MyWalletViewModel, willUpdateCreatedDate date: String)
}

class MyWalletViewModel: NSObject {
    weak var coordinatorDelegate: MyWalletViewModelCoordinatorDelegate?
    weak var viewDelegate: MyWalletViewModelViewDelegate?
    var title = "Wallet"
    var tokens: [Token] = []

    func logout() {
        coordinatorDelegate?.myWalletViewModelDidLogOut(self)
    }
    func showTreeMapView() {
        coordinatorDelegate?.myWalletViewModel(self, didSelectTreeMapView: TestTrees.getTestTrees(170))
    }
    func showPurchaseView() {
        coordinatorDelegate?.myWalletViewModelDidSelectPurchaseTokens(self)
    }
    func process(wallet: Wallet) {
        getImageFrom(urlString: wallet.coverUrl) { image in
            self.viewDelegate?.myWalletViewModel(self, willUpdateBannerImage: image)
        }
        getImageFrom(urlString: wallet.logoURL) { image in
            self.viewDelegate?.myWalletViewModel(self, willUpdateProfileImage: image)
        }
        
        viewDelegate?.myWalletViewModel(self, willUpdateProfileName: wallet.name)
        if let date = wallet.createdAt {
            viewDelegate?.myWalletViewModel(self, willUpdateCreatedDate: formatDateString(date: date))
        }

    }
}
extension MyWalletViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tokens.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TreeCell", for: indexPath) as? TreeCollectionViewCell else { return UICollectionViewCell()}
        cell.tokenID = tokens[indexPath.row].id
        cell.treeCellLabel.text = "Tree - \(indexPath.row)"
        return cell
    }
}
// Mark - Setting up the profile from the wallet information
extension MyWalletViewModel {
    func fetchWallet() {
        GreenstandWalletSDK.shared.myWallet() { [unowned self] result in
            switch result {
            case .success(let wallet):
                DispatchQueue.main.async {
                    self.process(wallet: wallet)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    private func getImageFrom(urlString: String?, completion: @escaping (UIImage?) -> Void){
        guard let urlString = urlString else { return }
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let imageData = data {
                    DispatchQueue.main.async {
                        let image = UIImage(data: imageData)!
                        completion(image)
                    }
                } else {
                    completion(nil)
                }
            }
            task.resume()
        }
    }
    private func formatDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let dateString = dateFormatter.string(from: date)
        return "Wallet created \(dateString)"
    }
}
// Mark - Getting and processing the token and tree information
extension MyWalletViewModel {
    func fetchTreeInfo() {
        GreenstandWalletSDK.shared.getTokens { [unowned self] result in
            switch result {
            case .success(let tokens):
                self.tokens = tokens
            case .failure(let error):
                print(error)
            }
        }
    }
    func getTreeImages() {
        var treeImageURLs: [String] = []
        for token in tokens {
            
        }
    }
}
