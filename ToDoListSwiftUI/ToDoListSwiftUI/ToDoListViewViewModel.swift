//
//  ToDoListViewViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 18/05/23.
//

import Foundation
import FirebaseFirestore


class ToDoListViewViewModel:ObservableObject{
    
    @Published var showingNewItemView = false
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    
    //MARK:- Delete To Do List Items
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        }
    
}
