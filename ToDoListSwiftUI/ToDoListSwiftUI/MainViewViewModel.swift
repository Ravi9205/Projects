//
//  MainViewViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 17/05/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel:ObservableObject{
    
    @Published var currentUserId = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self]_ , user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
        
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
