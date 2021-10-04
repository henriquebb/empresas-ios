//
//  CoordinatorFactoryProtocol.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import Foundation
import Swinject

protocol CoordinatorFactoryProtocol {
    init(_ resolver: Resolver)
    func makeAppCoordinator() -> AppCoordinator
    func makeLoginCoordinator() -> LoginCoordinator
}
