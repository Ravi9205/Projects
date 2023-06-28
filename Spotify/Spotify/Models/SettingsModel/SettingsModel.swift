//
//  SettingsModel.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 20/06/23.
//

import Foundation

struct Section{
    let title:String
    let option:[Option]
}

struct Option{
    let title:String
    let handler: () -> Void
}
