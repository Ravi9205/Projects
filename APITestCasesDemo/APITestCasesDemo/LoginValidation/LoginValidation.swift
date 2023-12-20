//
//  LoginValidation.swift
//  APITestCasesDemo
//
//  Created by Ravi Dwivedi on 14/07/23.
//

import Foundation



struct LoginValidation{
    
    func validate(request:LoginRequest) -> ValidationResponse {
        guard !request.useremail.isEmpty && !request.userPassword.isEmpty else {
            return  ValidationResponse(message:"email or password can't be an empty", isValid: false)
           
        }
        guard request.useremail.isValidEmail() else {
            return ValidationResponse(message:"email id is invalid", isValid: false)
        }
        return ValidationResponse(message: nil, isValid: true)
    }
    
    
}
