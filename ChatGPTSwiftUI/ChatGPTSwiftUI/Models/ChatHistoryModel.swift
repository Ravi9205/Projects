//
//  ChatHistoryModel.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 21/11/23.
//

import Foundation

struct ChatHistoryModel:Codable{
    let conversation_id:String?
    let prompt:String?
    let message_id:String?
    let response:String?
    let misc:String?
    
    private enum CodingKeys : String, CodingKey {
        case conversation_id
        case prompt
        case message_id
        case response
        case misc
    }
}



