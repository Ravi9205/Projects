//
//  Post.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 03/10/23.
//

import Foundation


struct UserPost:Identifiable,Codable{
    var id: String
    let ownerUid:String
    let caption:String
    let likes:Int
    let imageURL:String
    let timeStamp:Date
    let user:User?
}

extension UserPost{
    
    static var mockUserPostData:[UserPost] = [
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption:"This is caption test for now ",
              likes: 12,
              imageURL:"avatar",
              timeStamp: Date(),
              user: User.mockUserData[0]),
        
            .init(id:NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption:"This is another test caption for now ",
                  likes:21,
                  imageURL:"avatar",
                  timeStamp:Date(),
                  user: User.mockUserData[1]),
        
            .init(id:NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption:"This is another test caption for now ",
                  likes:6,
                  imageURL:"avatar",
                  timeStamp:Date(),
                  user: User.mockUserData[2]),
        
            .init(id:NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption:"This is another test caption for now ",
                  likes:50,
                  imageURL:"avatar",
                  timeStamp:Date(),
                  user: User.mockUserData[3]),
        
            .init(id:NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption:"This is another test caption for now ",
                  likes:100,
                  imageURL:"avatar",
                  timeStamp:Date(),
                  user: User.mockUserData[4]),
        
        
        
        
    ]
}
