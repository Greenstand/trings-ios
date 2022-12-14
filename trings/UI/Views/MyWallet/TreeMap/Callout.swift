//
//  Callout.swift
//  trings
//
//  Created by Robert Huber on 11/17/22.
//

import Foundation
import UIKit
import MapKit

class Callout: UIView {
    private let titleLabel = UILabel(frame: .zero)
    private let subtitleLabel = UILabel(frame: .zero)
    private let imageView = UIImageView(frame: .zero)
    private let annotation: Annotation
    
    init(annotation: Annotation) {
        self.annotation = annotation
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        setupTitle()
        setupSubtitle()
        setupImageView()
    }
    
    private func setupTitle() {
        titleLabel.font = UIFont(name: "Lato", size: 17)
        addSubview(titleLabel)
        titleLabel.text = "Tree ID: " + annotation.treeID
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setupSubtitle() {
        subtitleLabel.font = UIFont(name: "Lato", size: 14)
        subtitleLabel.textColor = .gray
        addSubview(subtitleLabel)
        subtitleLabel.text = "\(String(format: "lat: %.4f", annotation.coordinate.longitude)) \(String(format: "long: %.4f", annotation.coordinate.latitude))"
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setupImageView() {
        imageView.image = annotation.image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
    }
}
class Annotation: NSObject, MKAnnotation {
    let treeID: String
    let coordinate: CLLocationCoordinate2D
    let image: UIImage?
    
    init(tree: Tree) {
        coordinate = CLLocationCoordinate2D(latitude: tree.latitude, longitude: tree.longitude)
        image = UIImage(named: tree.image_url)
        treeID = tree.treeID
    }
}
