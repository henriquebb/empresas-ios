//
//  LoginViewControllerFactory.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 29/09/21.
//

import Foundation
import Swinject

class LoginViewControllerFactory: LoginViewControllerFactoryProtocol {
    
    let resolver: Resolver?
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeLoginViewController() -> LoginViewController {
        
        guard let presenter = resolver?.resolve(LoginPresenting.self) else {
            preconditionFailure("Login Presenter is nil")
        }
        
        let loginViewController = LoginViewController(presenter: presenter)
        return loginViewController
    }
}
