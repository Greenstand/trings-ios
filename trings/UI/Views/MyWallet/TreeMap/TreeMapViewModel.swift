//
//  TreeMapViewModel.swift
//  trings
//
//  Created by Robert Huber on 11/9/22.
//

import Foundation
import MapKit

protocol TreeMapViewModelCoordinatorDelegate: AnyObject {

}
protocol TreeMapViewModelDelegate: AnyObject {
    func treeMapViewModel(_ treeMapViewModel: TreeMapViewModel, willDisplayTrees treeAnnotations: [Annotation])
}
class TreeMapViewModel {
    weak var coordinatorDelegate: TreeMapViewModelCoordinatorDelegate?
    weak var viewDelegate: TreeMapViewModelDelegate?
    var trees: [Tree] = []
    var title = "Your Token Trees"
    func displayTreeAnnotations() {
        viewDelegate?.treeMapViewModel(self, willDisplayTrees: trees.map { Annotation(tree: $0) })
    }
}
