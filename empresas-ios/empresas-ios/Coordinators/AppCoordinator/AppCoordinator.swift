//
//  AppCoordinator.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 27/09/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var loginViewControllerFactory: LoginViewControllerFactory?
    
    init(navigationController: UINavigationController?, loginViewControllerFactory: LoginViewControllerFactory?) {
        self.navigationController = navigationController
        self.loginViewControllerFactory = loginViewControllerFactory
    }
    
    func start() {
        guard let loginVC = loginViewControllerFactory?.makeLoginViewController() else { return }
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
