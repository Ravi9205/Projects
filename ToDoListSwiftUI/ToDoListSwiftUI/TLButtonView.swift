//
//  TLButtonView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 17/05/23.
//

import SwiftUI

struct TLButtonView: View {
    @State var title = ""
    @State var background:Color
    
    var action:() -> Void
    
    var body: some View {
        Button{
            // Attemp to Login
            action()
            
            
        }label:{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct TLButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TLButtonView(title:"value", background: .pink, action: {
            
        })
    }
}
