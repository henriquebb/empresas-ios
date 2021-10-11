//
//  LoginAssembly.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import UIKit
import Swinject
import Domain

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        guard let loginCoordinator = container.resolve(LoginCoordinatorProtocol.self) as? LoginCoordinating else {
            return
        }
        container.register(LoginCoordinating.self) { resolver in
            loginCoordinator
        }
        container.register(LoginPresenting.self) { resolver in
            guard let emailValidationUseCase = resolver.resolve(EmailValidationUseCaseProtocol.self) else {
                preconditionFailure("EmailValidationUseCase is nil")
            }
            return LoginPresenter(coordinator: loginCoordinator, emailValidationUseCase: emailValidationUseCase)
        }
    }
}
