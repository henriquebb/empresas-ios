//
//  LoginViewControllerFactory.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 29/09/21.
//

import Foundation

struct LoginViewControllerFactory {
    func makeLoginViewController() -> LoginViewController {
        let loginViewController = LoginViewController()
        return loginViewController
    }
}
