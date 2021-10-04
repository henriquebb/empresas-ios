//
//  Coordinator.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 29/09/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
