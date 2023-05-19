//
//  RegisterViewViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 17/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegisterViewViewModel:ObservableObject{
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard let userId = result?.user.uid else{
                return
            }
            self?.createNewUser(userId: userId)
        }
        
    }
    
    private func createNewUser(userId:String){
        let user = UserModel(id: userId, name: fullName, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .setData(user.asDictionary())
    }
    
    func validate() -> Bool{
        errorMessage = ""
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else{
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
