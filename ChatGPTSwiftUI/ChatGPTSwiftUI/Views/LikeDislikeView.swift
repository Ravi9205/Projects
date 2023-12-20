//
//  LikeDislikeView.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 15/11/23.
//

import SwiftUI

struct LikeDislikeView: View {
        
    @State var copiedTxt:String?
    private let pasteBoard = UIPasteboard.general
    
    
    var body: some View {
        VStack {
            
            Button {
                print("Like Tapped")
            }
        label:{
            Text("Like")
                .font(.headline)
                .foregroundColor(Color(.label))
            
            Spacer()
            
            Image("Like")
                .scaledToFit()
                .tint(Color(.label))
                .padding(.trailing,10)
        }
            
            
            Button {
                print("DisLike Tapped")
                
            }
        label:{
            Text("Dislike")
                .font(.headline)
                .foregroundColor(Color(.label))
            
            Spacer()
            
            Image("Dislike")
                .scaledToFit()
                .tint(Color(.label))
                .padding(.trailing,10)
        }
         Button {
                copyLogPressText()
            }
          label:{
            Text("Copy")
                .font(.headline)
                .foregroundColor(Color(.label))
            
            Spacer()
            
            Image("Copy")
                .scaledToFit()
                .tint(Color(.label))
                .padding(.trailing,10)
        }
            
        }
    }
    
    func copyLogPressText(){
        pasteBoard.string = self.copiedTxt
        self.copiedTxt = ""
    }
}

struct LikeDislikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeDislikeView()
    }
}
