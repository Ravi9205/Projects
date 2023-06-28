//
//  FeaturedPlayListModel.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 21/06/23.
//

import Foundation



struct FeaturePlayListModel:Codable {
    let playlists:PlayListResponse
}

struct PlayListResponse:Codable{
    let items:[Playlist]
}

struct Playlist:Codable{
    let description:String
    let external_urls:[String:String]
    let id:String
    let images:[APIImageModel]
    let name:String
    let owner:User
     
}

struct User:Codable{
    let display_name:String
    let external_urls:[String:String]
    let id:String
}
