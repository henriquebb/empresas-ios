//
//  DomainAssembly.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 08/10/21.
//

import Swinject
import Domain

class DomainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(EmailValidationUseCaseProtocol.self) { resolver in
            EmailValidationUseCase()
        }
    }
}
