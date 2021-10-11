//
//  EmailValidationUseCase.swift
//  Domain
//
//  Created by Henrique Barbosa on 08/10/21.
//

import UIKit

public protocol EmailValidationUseCaseProtocol {
    func execute(email: String) -> Bool
}

public class EmailValidationUseCase {
    public init() {}
}

extension EmailValidationUseCase: EmailValidationUseCaseProtocol {
    public func execute(email: String) -> Bool {
        guard email != "" else {
            return false
        }
        let regularExp = try? NSRegularExpression(pattern: "^\\w+@\\w+\\.com(\\.[a-z][a-z])?$", options: .caseInsensitive)

        let result = regularExp?.matches(in: email, options: .reportCompletion, range: (email as NSString).range(of: email))
        
        guard result?.count ?? 0 == 1 else {
            return false
        }
        
        return true
    }
}
