//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by ARM 097 on 07/11/22.
//

import Foundation

protocol AuthenticationProtocal {
    var formIsValid:Bool{get}
}
struct LoginViewModel:AuthenticationProtocal {
    var email: String?
    var password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty==false
            && password?.isEmpty==false
    }
}
