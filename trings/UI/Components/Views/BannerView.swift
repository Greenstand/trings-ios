//
//  BannerView.swift
//  trings
//
//  Created by Robert Huber on 11/3/22.
//

import Foundation
import UIKit

class BannerView: UIView {
    var bannerImageView = UIImageView()
    var profileImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        bannerImageView.frame = CGRect(x: 0, y: 0, width: frame.width , height: frame.height - 10)
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.layer.masksToBounds = true
        profileImageView.frame = CGRect(x: frame.width/10, y: frame.height / 2, width: 120, height: 120)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.backgroundColor = .white
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.masksToBounds = true
        self.addSubview(bannerImageView)
        self.addSubview(profileImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
