//
//  LoginViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 17/05/23.
//

import Foundation
import SwiftUI
import FirebaseAuth



class LoginViewModel:ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    
    func login(){
        guard validate() else {
            return
        }
        // Try Login
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill all the fields"
            return false
        }
        
        //Email
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "please enter a valid email Id"
            return false
        }
        
        // Password
        guard password.count >= 6 else {
            errorMessage = "Password length should be of 8 Characters minimum"
            return false
        }
        
        return true
        
    }
}
