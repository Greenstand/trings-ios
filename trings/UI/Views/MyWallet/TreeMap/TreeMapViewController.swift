//
//  TreeMapViewController.swift
//  trings
//
//  Created by Robert Huber on 11/9/22.
//

import UIKit
import MapKit
class TreeMapViewController: UIViewController {

    @IBOutlet private weak var treeMapView: MKMapView! {
        didSet {
            treeMapView.delegate = self
        }
    }
    var viewModel: TreeMapViewModel? {
        didSet {
            title = viewModel?.title
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.displayTreeAnnotations()
    }
}
extension TreeMapViewController: TreeMapViewModelDelegate {
    func treeMapViewModel(_ treeMapViewModel: TreeMapViewModel, willDisplayTrees treeAnnotations: [Annotation]) {
        treeMapView.addAnnotations(treeAnnotations)
    }
}
extension TreeMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        guard !(annotation is MKClusterAnnotation) else {
            return mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier, for: annotation)
        }
        let annotationIdentifier = "Identifier"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        }
        
        if let annotationView = annotationView {
            
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "treeMarker")
            annotationView.clusteringIdentifier = "Tree"
            
        }
        if let annotation = annotation as? Annotation {
            annotationView?.detailCalloutAccessoryView = Callout(annotation: annotation)
        }
        
        return annotationView
    }
}

