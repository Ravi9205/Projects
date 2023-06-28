//
//  AuthResponse.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 02/06/23.
//

import Foundation


struct AuthResponse:Codable
{
    let acccess_token:String
    let expires_in:Int
    let refresh_token:String?
    let scope:String
    let token_type:String
}
