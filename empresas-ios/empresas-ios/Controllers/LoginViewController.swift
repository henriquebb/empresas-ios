//
//  LoginViewController.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 21/09/21.
//

import UIKit

protocol LoginPresenting: AnyObject {
    func validateEmail(email: String)
}

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    private var presenter: LoginPresenting?
    
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
        loginView.delegate = self
        view = loginView
    }
}

extension LoginViewController: LoginViewDelegate {
    func validateEmail(email: String) {
        guard let presenter = presenter else {
            preconditionFailure("Presenter is nil")
        }
        presenter.validateEmail(email: email)
    }
}

extension LoginViewController: LoginViewable {
    func validateEmail(value: Bool) {
        loginView.modifyEmailTextFieldLayout(validationResult: value)
    }
}

