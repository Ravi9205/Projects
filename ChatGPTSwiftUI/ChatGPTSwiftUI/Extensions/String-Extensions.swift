//
//  String-Extensions.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 30/11/23.
//

import Foundation

extension String {
    var parseJSONString: Any? {
        let data = self.data(using: .utf8, allowLossyConversion: false)
        if let jsonData = data {
            return try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as AnyObject
            
        } else {
            return nil
        }
    }
}

//MARK:- Slipting the String Before and after spe
extension String {
    func before(first delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            let before = prefix(upTo: index)
            return String(before)
        }
        return ""
    }
    
    func after(first delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            let after = suffix(from: index).dropFirst()
            return String(after)
        }
        return ""
    }
}
