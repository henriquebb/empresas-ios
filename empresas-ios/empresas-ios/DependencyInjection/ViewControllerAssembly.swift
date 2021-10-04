//
//  ViewControllerAssembly.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import UIKit
import Swinject

class ViewControllerAssembly: Assembly {

    func assemble(container: Container) {
        container.register(LoginViewControllerFactoryProtocol.self) { resolver in
            LoginViewControllerFactory(resolver: resolver)
        }
    }
}
