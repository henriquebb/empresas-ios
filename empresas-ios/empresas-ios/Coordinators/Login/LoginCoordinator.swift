//
//  LoginCoordinator.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import UIKit

class LoginCoordinator: Coordinator, LoginCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var loginViewControllerFactory: LoginViewControllerFactoryProtocol?
    
    required init(navigationController: UINavigationController,
                  loginViewControllerFactory: LoginViewControllerFactoryProtocol?) {
        self.navigationController = navigationController
        self.loginViewControllerFactory = loginViewControllerFactory
    }
    
    func start() {
        guard let loginVC = loginViewControllerFactory?.makeLoginViewController() else { return }
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(loginVC, animated: true)
    }
}

extension LoginCoordinator: LoginCoordinating {
    
}
