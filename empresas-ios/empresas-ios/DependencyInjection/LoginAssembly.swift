//
//  LoginAssembly.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import UIKit
import Swinject

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        guard let loginCoordinator = container.resolve(LoginCoordinatorProtocol.self) as? LoginCoordinating else {
            return
        }
        container.register(LoginCoordinating.self) { resolver in
            loginCoordinator
        }
        container.register(LoginPresenting.self) { resolver in
            LoginPresenter(coordinator: loginCoordinator)
        }
    }
}
