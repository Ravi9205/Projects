//
//  LoginValidation.swift
//  MVVMDemoUsingLogin
//
//  Created by Ravi Dwivedi on 17/07/23.
//

import Foundation



struct LoginValidation {
    
    func validate(loginRequest:LoginRequest) -> LoginValidationResult{
        guard !loginRequest.userEmail.isEmpty && !loginRequest.userPassword.isEmpty else {
            return LoginValidationResult(error:"User email and password can't be empty", isValid: false)
        }
        return LoginValidationResult(error: nil, isValid: true)
        
    }
}
