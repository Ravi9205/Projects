//
//  LoginHandler.swift
//  APITestCasesDemo
//
//  Created by Ravi Dwivedi on 14/07/23.
//

import Foundation



struct LoginHandler {
    
    private let validation = LoginValidation()
    private let loginApiResource =  LoginApiResource()
    
    func authenticateUser(request:LoginRequest,completionHandler:@escaping(_ loginData:LoginData?)->()){
        let validationResult  = validation.validate(request: request)
        
        if validationResult.isValid {
            loginApiResource.authenticateUser(request: request) { response in
                completionHandler(LoginData(errorMessage:nil,response: response))
            }
            
        }
        else
        {
            completionHandler(LoginData(errorMessage: validationResult.message, response: nil))
        }
    }
    
}
