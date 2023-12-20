//
//  ConversationHistoryModel.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 27/11/23.
//

import Foundation


struct ConversationHistoryModel:Codable {
    let conversation_id:String
    let title:String
    let updated_at:String
    
    private enum CodingKeys : String, CodingKey {
        case conversation_id
        case title
        case updated_at
    }
    
}
