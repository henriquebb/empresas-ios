//
//  LoginPresenter.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import Foundation
import Domain

protocol LoginViewable: AnyObject {
    func validateEmail(value: Bool)
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
    func validateEmail(email: String) {
        let value = emailValidationUseCase.execute(email: email)
        view?.validateEmail(value: value)
    }
}
