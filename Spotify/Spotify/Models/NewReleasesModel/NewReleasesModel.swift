//
//  NewReleasesModel.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 21/06/23.
//

import Foundation


struct NewReleasesModel :Codable{
    let albums:AlbumsResponse
}

struct AlbumsResponse:Codable{
    let items:[Album]
}

struct Album:Codable{
    let album_type:String
    let avaiable_markets:[String]
    let id:String
    let images:[APIImageModel]
    let name:String
    let release_date:String
    let total_tracks:Int
    let artists:[ArtistModel]
}

