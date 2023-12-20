//
//  LoginViewModel.swift
//  MVVMDemoUsingLogin
//
//  Created by Ravi Dwivedi on 17/07/23.
//

import Foundation


struct LoginViewModel{
    var dataHandler:()->(LoginResponse)
    mutating func CallLoginApi(){
        guard let url = URL(string:"") else {
            return
        }
        let loginRequest = URLRequest(url: url)
        ApiCaller.shared.callLoginApi(loginRequest:loginRequest ) {  loginReponse in
       }
    }
}


