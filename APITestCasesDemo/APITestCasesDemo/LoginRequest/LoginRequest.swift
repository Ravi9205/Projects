//
//  LoginRequest.swift
//  APITestCasesDemo
//
//  Created by Ravi Dwivedi on 14/07/23.
//

import Foundation


struct LoginRequest :Encodable{
    let useremail, userPassword:String
}
