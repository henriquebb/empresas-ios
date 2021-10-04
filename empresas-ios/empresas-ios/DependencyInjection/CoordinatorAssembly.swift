//
//  CoordinatorAssembly.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import UIKit
import Swinject

class CoordinatorAssembly: Assembly {
    
    let navigationController = UINavigationController()
    
    func assemble(container: Container) {
        container.register(AppCoordinatorProtocol.self) { resolver in
            guard let coordinatorFactory = container.resolve(CoordinatorFactoryProtocol.self) else {
                preconditionFailure("Coordinator Factory is nil")
            }
            return AppCoordinator(navigationController: self.navigationController, coordinatorFactory: coordinatorFactory)
        }
        container.register(LoginCoordinatorProtocol.self) { resolver in
            let loginViewControllerFactory = resolver.resolve(LoginViewControllerFactoryProtocol.self)
            return LoginCoordinator(navigationController: self.navigationController, loginViewControllerFactory: loginViewControllerFactory)
        }
    }
}
