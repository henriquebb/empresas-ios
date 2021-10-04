//
//  LoginPresenter.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import Foundation

protocol LoginViewable: AnyObject {
    
}

protocol LoginCoordinating: AnyObject {
    
}

class LoginPresenter {
    
    private weak var view: LoginViewable?
    private weak var coordinator: LoginCoordinating?
    
    init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
    
    func attachView(_ view: LoginViewable) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenting {
    
}
