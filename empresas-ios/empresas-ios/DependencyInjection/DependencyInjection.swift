//
//  DependencyInjection.swift
//  empresas-ios
//
//  Created by Henrique Barbosa on 29/09/21.
//

import Swinject

class DependencyInjection {
    
    var assembler: Assembler?
    
    init() {
        assembler = Assembler([LoginAssembly()])
    }
}
