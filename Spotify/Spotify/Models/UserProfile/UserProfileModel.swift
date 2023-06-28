//
//  UserProfile.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 26/05/23.
//

import Foundation

struct UserProfile:Codable {
    var country:String
    var display_name:String
    var email:String
    var explict_content:[String:Bool]
    var external_urls:[String:String]
    //let followers:[String:Codable?]
    let id:String
    let product:String
    let images:[APIImageModel]
}



