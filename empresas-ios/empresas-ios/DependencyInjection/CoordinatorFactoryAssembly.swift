//
//  CoordinatorFactoryAssembly.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import UIKit
import Swinject

class CoordinatorFactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CoordinatorFactoryProtocol.self) { resolver in
            CoordinatorFactory(resolver)
        }
    }
}
