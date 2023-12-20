//
//  ApiManager.swift
//  NewProject
//
//  Created by Ravi Dwivedi on 06/10/23.
//

import Foundation



final class ApiManager {
    
    static let shared = ApiManager()
    private init(){}
    
    
    func sendMessage(request:UserRequestModel){
        
    }
    
    func getMessage() -> UserModel{
        return UserModel(userName:"", id:"", sendermessageBody:"", receiverMessageBody:"")
        
    }
    
}
