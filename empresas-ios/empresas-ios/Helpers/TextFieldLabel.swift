//
//  Label.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 07/10/21.
//

import UIKit

class TextFieldLabel: UILabel {
    let edgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += edgeInsets.left
        return size
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: edgeInsets))
    }
    
    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - edgeInsets.left
        }
    }
}
