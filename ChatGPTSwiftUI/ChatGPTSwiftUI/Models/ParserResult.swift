//
//  ParserResult.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 15/11/23.
//

import Foundation



struct ParserResult: Identifiable {
    let id = UUID()
    let attributedString: AttributedString
    let isCodeBlock: Bool
    let codeBlockLanguage: String?

}
