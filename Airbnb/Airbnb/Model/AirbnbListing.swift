//
//  AirbnbListing.swift
//  Airbnb
//
//  Created by Ravi Dwivedi on 12/10/23.
//

import Foundation


struct AirbnbListing:Codable,Equatable,Identifiable,Hashable{
    
    let id:String?
    let listing_url:String?
    let name:String?
    let summary:String?
    let space:String?
    let description:String?
    let house_rules:String?
    let thumbnail_url:String?       
    let medium_url:String?
    let xl_picture_url:String?
    let heighbourhood:String?
    let price:Int?

    //hot details
    let host_name:String
    let host_since:String
    let host_thumbnail_url:String
    let host_picture_url:String
    let amenities:[String]
    
}
