//
//  StringExtension.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 28/11/23.
//

import Foundation


extension NSMutableAttributedString {

    public func setAsLink(textToFind:String, linkURL:String) -> Bool {

        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}
