//
//  Colors.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 07/10/21.
//

import UIKit

extension UIColor {
    static var customGrey: UIColor {
        return UIColor(named: "grey") ?? #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
    }
    
    static var customLightGrey: UIColor {
        return UIColor(named: "light_grey") ?? #colorLiteral(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
    }
    
    static var customMediumGrey: UIColor {
        return UIColor(named: "medium_grey") ?? #colorLiteral(red: 0.462745098, green: 0.462745098, blue: 0.4666666667, alpha: 1)
    }
    
    static var customDarkGrey: UIColor {
        return UIColor(named: "dark_grey") ?? #colorLiteral(red: 0.3294117647, green: 0.3411764706, blue: 0.3490196078, alpha: 1)
    }
    
    static var customError: UIColor {
        return UIColor(named: "error") ?? #colorLiteral(red: 0.7411764706, green: 0.3058823529, blue: 0.3058823529, alpha: 1)
    }
}
