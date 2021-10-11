//
//  LoginPresenter.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import Foundation
import Domain

protocol LoginViewable: AnyObject {
    
}

protocol LoginCoordinating: AnyObject {
    
}

class LoginPresenter {
    
    private weak var view: LoginViewable?
    private weak var coordinator: LoginCoordinating?
    private var emailValidationUseCase: EmailValidationUseCaseProtocol
    
    init(coordinator: LoginCoordinating, emailValidationUseCase: EmailValidationUseCaseProtocol) {
        self.coordinator = coordinator
        self.emailValidationUseCase = emailValidationUseCase
    }
    
    func attachView(_ view: LoginViewable) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenting {
    
}

extension LoginPresenter: LoginViewDelegate {
    func validateEmail(email: String) -> Bool {
        emailValidationUseCase.execute(email: email)
    }
}
