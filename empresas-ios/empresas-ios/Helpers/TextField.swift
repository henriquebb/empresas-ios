//
//  TextField.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 07/10/21.
//

import UIKit

protocol TextFieldDelegate: AnyObject {
    func validateResult(text: String)
}

class TextField: UITextField {
    
    weak var validationDelegate: TextFieldDelegate?
    
    let edgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 35)
    
    init() {
        super.init(frame: .zero)
        delegate = self
        addTarget(self, action: #selector(textDidChange(textField:)), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
}

extension TextField: UITextFieldDelegate {
    
    @objc func textDidChange(textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        validationDelegate?.validateResult(text: text)
    }
}
