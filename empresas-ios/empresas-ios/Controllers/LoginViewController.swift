//
//  LoginViewController.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 21/09/21.
//

import UIKit

protocol LoginPresenting: AnyObject {
    
}

class LoginViewController: UIViewController {
    
    var loginView = LoginView()
    var presenter: LoginPresenting?
    
    init(presenter: LoginPresenting) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = LoginView()
    }
}

extension LoginViewController: LoginViewable {
    
}

