//
//  Coordinator.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import UIKit

protocol CoordinatorConfigurable {
    var navigationController: UINavigationController { get }
}

struct CoordinatorConfiguration: CoordinatorConfigurable {
    let navigationController: UINavigationController
}

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var configuration: CoordinatorConfigurable { get }
    func start()
}

extension Coordinator {

    func startCoordinator(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
