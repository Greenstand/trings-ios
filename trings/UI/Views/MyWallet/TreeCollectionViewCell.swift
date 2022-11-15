//
//  TreeCollectionViewCell.swift
//  trings
//
//  Created by Robert Huber on 11/3/22.
//

import UIKit

class TreeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var treeCellLabel: UILabel!
    @IBOutlet weak var treeCellImageView: UIImageView! {
        didSet {
            treeCellImageView.contentMode = .scaleAspectFill
        }
    }
}
