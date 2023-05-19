//
//  ToDoListItemViewViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 19/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ToDoListItemViewViewModel:ObservableObject{
    
    init(){}
    
    func toggleIsDone(item:ToDoListItemModel){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
            
    }
    
}
