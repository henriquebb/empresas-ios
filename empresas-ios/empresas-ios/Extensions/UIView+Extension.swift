//
//  UIView+Extension.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 08/10/21.
//

import UIKit

extension UIView {
    func addTapGesture(target: UIView, action: Selector) {
        let gesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(gesture)
    }
}
