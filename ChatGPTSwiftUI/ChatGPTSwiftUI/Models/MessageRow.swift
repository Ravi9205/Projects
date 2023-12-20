//
//  MessageRow.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 15/11/23.
//

import Foundation
import SwiftUI

struct AttributedOutput {
    let string: String
    let results: [ParserResult]
}

enum MessageRowType: Equatable{
    static func == (lhs: MessageRowType, rhs: MessageRowType) -> Bool {
        return lhs.text == rhs.text
    }
    case attributed(AttributedOutput)
    case rawText(String)
    var text: String {
        switch self {
        case .attributed(let attributedOutput):
            return attributedOutput.string
        case .rawText(let string):
            return string
        
        }
    }
}

struct MessageRow: Identifiable,Equatable{
    
    let id = UUID()
    var isInteractingWithChatGPT: Bool

    let sendImage: String
    let send: MessageRowType
    var sendText: String {
        send.text
    }
    
    let message_id:String?
    let prompt:String?
    let conversation_id:String?
    let misc:String?

    let responseImage: String
    
    var response: MessageRowType?
    var responseText: String? {
        response?.text
    }
    var responseError: String?
    
}


