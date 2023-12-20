//
//  ResponseParsingTask.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 15/11/23.
//

import Foundation
import Markdown

actor ResponseParsingTask {

    func parse(text: String) async -> AttributedOutput {
        let document = Document(parsing: text)
        
        var markdownParser =  MarkDownAttributedStringParser()
        let results = markdownParser.parserResult(from: document)
        return AttributedOutput(string: text, results: results)
    }

}
