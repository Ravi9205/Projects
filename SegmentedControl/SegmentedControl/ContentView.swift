//
//  ContentView.swift
//  SegmentedControl
//
//  Created by Ravi Dwivedi on 16/11/23.
//

import SwiftUI

struct ContentView: View {
   @State var segmentedChoice = 0
    
    var body: some View {
        VStack{
            Picker("",selection: $segmentedChoice){
                Text("GPT-3.5").tag(0)
                Text("GPT-4").tag(1)
                
            }
            .frame(width: 400, height: 50)
            .padding()
            .pickerStyle(.segmented)
            .foregroundColor(.red)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
