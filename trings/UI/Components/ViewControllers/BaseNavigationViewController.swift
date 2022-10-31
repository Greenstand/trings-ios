//
//  BaseNavigationViewController.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = .darkGray
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [
//            .font: FontFamily.Montserrat.bold.font(size: 15),
            .foregroundColor: UIColor.darkGray
        ]
        navigationBar.largeTitleTextAttributes = [
//            .font: FontFamily.Montserrat.bold.font(size: 35),
            .foregroundColor: UIColor.darkGray
        ]
    }
}
