//
//  AppCoordinator.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 27/09/21.
//

import UIKit

class AppCoordinator: Coordinator, AppCoordinatorProtocol {

    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var coordinatorFactory: CoordinatorFactoryProtocol?
    
    
    required init(navigationController: UINavigationController?, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
    }
    
    func start() {
        guard let loginCoordinator = coordinatorFactory?.makeLoginCoordinator() else {
            return
        }
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
}
