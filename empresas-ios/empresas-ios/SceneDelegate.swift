//
//  SceneDelegate.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 21/09/21.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    var assembler: Assembler?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        assembler = DependencyInjection().assembler
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        guard let appCoordinator = assembler?.resolver.resolve(AppCoordinatorProtocol.self) as? AppCoordinator else {
            preconditionFailure("App Coordinator is nil")
        }
        self.appCoordinator = appCoordinator
        window?.rootViewController = appCoordinator.navigationController
        // coordinator = AppCoordinator(navigationController: UINavigationController)
        window?.windowScene = windowScene
        appCoordinator.start()
    }
}

