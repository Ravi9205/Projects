//
//  ApiCaller.swift
//  MVVMDemoUsingLogin
//
//  Created by Ravi Dwivedi on 17/07/23.
//

import Foundation



class ApiCaller {
    static let shared  = ApiCaller()
    private init(){}
    

    func callLoginApi(loginRequest:URLRequest, completionHandler:@escaping(LoginResponse)-> Void){
        
        URLSession.shared.dataTask(with: loginRequest) { loginData, loginReponse, error in
            //
            guard let data = loginData, error != nil else {
                print("Something Went wrong")
                return
            }
            
            do{
                let loginResult =  try JSONDecoder().decode(LoginResponse.self, from: data)
                print("LoginResponse===\(loginResult)")
            }
            
            catch let error{
                print(error.localizedDescription)
            }
        }
        
        
    }
    
}
