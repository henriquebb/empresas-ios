//
//  AppCoordinatorFactory.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import UIKit
import Swinject

class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    let resolver: Resolver?
    
    required init(_ resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeLoginCoordinator() -> LoginCoordinator {
        guard let coordinator = resolver?.resolve(LoginCoordinatorProtocol.self) as? LoginCoordinator else {
            preconditionFailure("LoginCoordinator is nil")
        }
        return coordinator
    }
    
    func makeAppCoordinator() -> AppCoordinator {
        guard let coordinator = resolver?.resolve(AppCoordinatorProtocol.self) as? AppCoordinator else {
            preconditionFailure("App Coordinator is nil")
        }
        return coordinator
    }
}
