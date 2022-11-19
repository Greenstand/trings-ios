//
//  TreeMapViewModel.swift
//  trings
//
//  Created by Robert Huber on 11/9/22.
//

import Foundation
protocol TreeMapViewModelCoordinatorDelegate: AnyObject {
    
}
protocol TreeMapViewModelDelegate: AnyObject {
    
}
class TreeMapViewModel {
    weak var coordinatorDelegate: TreeMapViewModelCoordinatorDelegate?
    weak var viewDelegate: TreeMapViewModelDelegate?
    var title = "Your Token Trees"
}
