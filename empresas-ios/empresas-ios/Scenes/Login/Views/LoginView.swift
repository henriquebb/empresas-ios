//
//  LoginView.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 04/10/21.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func validateEmail(email: String) -> Bool
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.Login.loginBackground)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        [viewLabel, textFieldStack, loginButton].forEach { view.addSubview($0) }
        return view
    }()
    
    private lazy var welcomeStack: UIStackView = {
        let labelStack = UIStackView()
        let topLabel = UILabel()
        let bottomLabel = UILabel()
        
        topLabel.text = "Boas vindas,"
        topLabel.font = UIFont(name: "Khula-Bold", size: 40)
        topLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        bottomLabel.text = "Você esta no empresas."
        bottomLabel.font = UIFont(name: "Roboto-Light", size: 24)
        bottomLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        [topLabel, bottomLabel].forEach {
            $0.textColor = .white
            labelStack.addArrangedSubview($0)
        }
        labelStack.axis = .vertical
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        return labelStack
    }()
    
    private lazy var viewLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite seus dados para continuar."
        label.font = UIFont(name: "Khula-SemiBold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textFieldStack: UIStackView =  {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        [emailStackView, passwordStackView].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        [emailTextFieldLabel, emailTextField, emailTextFieldErrorLabel].forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    private lazy var emailTextFieldLabel: TextFieldLabel = {
        let label = TextFieldLabel()
        label.text = "Email"
        label.font = UIFont(name: "Roboto-Medium", size: 12)
        label.textColor = .customDarkGrey
        label.isHidden = true
        return label
    }()
    
    private lazy var emailTextFieldErrorLabel: TextFieldLabel = {
        let label = TextFieldLabel()
        label.text = "Endereço de email inválido"
        label.font = UIFont(name: "Roboto-Medium", size: 12)
        label.textColor = .customError
        label.isHidden = true
        return label
    }()
    
    private lazy var emailTextField: TextField = {
        let emailTextField = TextField()
        emailTextField.validationDelegate = self
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.borderColor = UIColor.customLightGrey.cgColor
        emailTextField.placeholder = "Email"
        emailTextField.tintColor = .customLightGrey
        emailTextField.textContentType = .emailAddress
        return emailTextField
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        [passwordTextFieldLabel, passwordTextField].forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    private lazy var passwordTextFieldLabel: TextFieldLabel = {
        let label = TextFieldLabel()
        label.text = "Senha"
        label.font = UIFont(name: "Roboto-Medium", size: 12)
        label.textColor = .customDarkGrey
        label.isHidden = true
        return label
    }()
    
    private lazy var passwordEyeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage.Login.passwordEye
        imageView.tintColor = .customMediumGrey
        return imageView
    }()
    
    private lazy var passwordTextField: TextField = {
        let passwordTextField = TextField()
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderColor = UIColor.customLightGrey.cgColor
        passwordTextField.placeholder = "Senha"
        passwordTextField.tintColor = .customLightGrey
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTapGesture(target: self, action: #selector(togglePasswordVisibility))
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("ENTRAR", for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Medium", size: 14)
        button.backgroundColor = .customGrey
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var viewHeightAnchor: NSLayoutConstraint?
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        activateConstraints()
        addExpandingTouchGesture()
        addDismissTouchGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func addSubviews() {
        [imageView, view, welcomeStack, passwordEyeImageView].forEach { addSubview($0) }
    }
}

extension LoginView {
    
    func addDismissTouchGesture() {
        imageView.addTapGesture(target: self, action: #selector(handleDimissTouch))
        welcomeStack.arrangedSubviews.forEach {
            $0.isUserInteractionEnabled = true
            $0.addTapGesture(target: self, action: #selector(handleDimissTouch))
        }
    }
    
    func addExpandingTouchGesture() {
        view.addTapGesture(target: self, action: #selector(handleExpandingTouch))
    }
    
    @objc func handleDimissTouch() {
        UIView.animate(withDuration: 0.2) {
            self.viewHeightAnchor?.isActive = false
            self.viewHeightAnchor = self.view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.44)
            self.viewHeightAnchor?.priority = .defaultLow
            self.viewHeightAnchor?.isActive = true
            
            self.emailTextFieldLabel.isHidden = true
            self.passwordTextFieldLabel.isHidden = true
            self.layoutIfNeeded()
        }
    }
    
    @objc func handleExpandingTouch() {
        UIView.animate(withDuration: 0.2) {
            self.viewHeightAnchor?.isActive = false
            self.viewHeightAnchor = self.view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.725)
            self.viewHeightAnchor?.isActive = true
            
            self.emailTextFieldLabel.isHidden = false
            self.passwordTextFieldLabel.isHidden = false
            self.layoutIfNeeded()
        }
    }
    
    @objc func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
    }
}

extension LoginView {
    func activateConstraints() {
        setImageViewConstraints()
        setViewConstraints()
        setWelcomeLabelConstraints()
        setViewLabelConstraints()
        setTextFieldStackConstraints()
        setButtonConstraints()
        setTextFieldHeight()
        setPasswordEyeConstraints()
    }
    
    func setImageViewConstraints() {
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     imageView.topAnchor.constraint(equalTo: topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    func setViewConstraints() {
        viewHeightAnchor = view.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.44)
        guard let viewHeightAnchor = viewHeightAnchor else {
            return
        }
        viewHeightAnchor.priority = .defaultLow
        NSLayoutConstraint.activate([view.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     view.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     view.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     viewHeightAnchor])
    }
    
    func setWelcomeLabelConstraints() {
        NSLayoutConstraint.activate([welcomeStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     welcomeStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                                     welcomeStack.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -10)])
    }
    
    func setViewLabelConstraints() {
        NSLayoutConstraint.activate([viewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     viewLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
                                     viewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)])
    }
    
    func setTextFieldHeight() {
        NSLayoutConstraint.activate([emailTextField.heightAnchor.constraint(equalToConstant: 48),
                                     passwordTextField.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func setTextFieldStackConstraints() {
        NSLayoutConstraint.activate([textFieldStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     textFieldStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
                                     textFieldStack.topAnchor.constraint(equalTo: viewLabel.bottomAnchor, constant: 32)])
    }
    
    func setButtonConstraints() {
        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 42),
                                     loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
                                     loginButton.heightAnchor.constraint(equalToConstant: 48),
                                     loginButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)])
    }
    
    func setPasswordEyeConstraints() {
        NSLayoutConstraint.activate([passwordEyeImageView.heightAnchor.constraint(equalToConstant: 10.27),
                                     passwordEyeImageView.widthAnchor.constraint(equalToConstant: 14.12),
                                     passwordEyeImageView.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor,
                                                                                    constant: -19.73),
                                     passwordEyeImageView.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor)])
    }
}

extension LoginView: TextFieldDelegate {
    func validateResult(text: String) {
        guard let result = delegate?.validateEmail(email: text) else {
            return
        }
        emailTextFieldErrorLabel.isHidden = result ? true : false
        emailTextFieldLabel.textColor = result ? .customDarkGrey : .customError
        emailTextField.layer.borderColor = result ? UIColor.customLightGrey.cgColor : UIColor.customError.cgColor
    }
}


