//
//  RegistrationViewModel.swift
//  ChatApp
//
//  Created by ARM 097 on 07/11/22.
//

import Foundation
	struct RegistrationViewModel:AuthenticationProtocal{
    var email: String?
    var password: String?
    var fullname:String?
    var username:String?
    
    var formIsValid: Bool{
        return email?.isEmpty==false
            && password?.isEmpty==false
            && fullname?.isEmpty==false
        && username?.isEmpty==false
        
    }
}
