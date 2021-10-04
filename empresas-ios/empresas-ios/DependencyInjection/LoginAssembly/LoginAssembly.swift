//
//  LoginAssembly.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 29/09/21.
//

import UIKit
import Swinject

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppCoordinator.self) { resolver in
            AppCoordinator(navigationController: UINavigationController(), loginViewControllerFactory: LoginViewControllerFactory())
        }
    }
}
