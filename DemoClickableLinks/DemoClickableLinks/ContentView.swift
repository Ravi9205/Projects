//
//  ContentView.swift
//  DemoClickableLinks
//
//  Created by Ravi Dwivedi on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



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
