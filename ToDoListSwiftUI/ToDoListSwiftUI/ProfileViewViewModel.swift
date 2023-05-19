//
//  ProfileViewViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 18/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProfileViewViewModel:ObservableObject{
    
    @Published var user:UserModel? = nil
    init(){}
    
    //MARK:- Fetch UsersList
    func fetchUsers(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument {[weak self] snapShot, error in
            
            guard let data = snapShot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = UserModel(id: data["id"] as? String ?? "",
                                       name: data["name"] as? String ?? "",
                                       email: data["email"] as? String ?? "",
                                       joined: data["joined"] as? TimeInterval ?? 0)
                
            }
        }
    }
    
    //MARK:- LogOut
    func logOut(){
        do{
            try Auth.auth().signOut()
        }
        catch
        {
            print(error)
        }
    }
    
}
