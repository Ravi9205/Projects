//
//  ToDoListItemModel.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 18/05/23.
//

import Foundation


struct ToDoListItemModel:Codable, Identifiable{
    
    let id:String
    let title:String
    let dueDate:TimeInterval
    let createdDate:TimeInterval
    var isDone:Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
