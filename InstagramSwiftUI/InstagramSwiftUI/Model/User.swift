//
//  User.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 03/10/23.
//

import Foundation

struct User:Identifiable,Codable{
    let id: String
    var userName:String
    var profileImage:String?
    var fullName:String?
    var bio:String?
    let email:String
}

extension User{
    
    static var mockUserData:[User] = [
        
        .init(id:NSUUID().uuidString, userName:"Codecat15", profileImage:"avatar", fullName:"Ravi Dixit", bio: "Swift Programmer", email:"codecat15@gmail.com"),
            .init(id:NSUUID().uuidString, userName:"letscode", profileImage:"avatar", fullName:"Mohit Dixit", bio: "Swift Programmer", email:"letscode@gmail.com"),
            .init(id:NSUUID().uuidString, userName:"Jone", profileImage:"avatar", fullName:"Jone Due", bio: "Swift Programmer and educator", email:"jone@gmail.com"),
            .init(id:NSUUID().uuidString, userName:"Michell", profileImage:"avatar", fullName:"Michell Lee", bio: "Swift Programmer and instructor", email:"michell@gmail.com"),
            .init(id:NSUUID().uuidString, userName:"Leonel", profileImage:"avatar", fullName:"Leonel Lee", bio: "Swift Programmer and instructor", email:"leonel@gmail.com")
        
    ]
}
