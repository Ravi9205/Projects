//
//  UserModel.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 17/05/23.
//

import Foundation


struct UserModel:Codable{
    let id: String
    let name:String
    let email:String
    let joined:TimeInterval
}
