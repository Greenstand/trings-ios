//
//  PrieviewPurchaseViewModel.swift
//  trings
//
//  Created by Robert Huber on 11/8/22.
//

import Foundation
protocol PreviewPurchaseViewModelCoordinatorDelegate: AnyObject {
    
}
protocol PreviewPurchaseViewModelDelegate: AnyObject {
    
}
class PreviewPurchaseViewModel {
    weak var coordinatorDelegate: PreviewPurchaseViewModelCoordinatorDelegate?
    weak var viewDelegate: PurchaseTokensViewModelDelegate?
    var tokens: Observable<Int> = Observable(0)
    var costPerToken: Double = 1.0
}
