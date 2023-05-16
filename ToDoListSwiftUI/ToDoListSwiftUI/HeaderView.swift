//
//  HeaderView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 16/05/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.pink)
                .rotationEffect(Angle(degrees: 15))
            
            VStack{
                Text("TO DO LIST")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 50))
                Text("Gets things done")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
            }
            .padding(.top,30)
            
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 300)
        .offset(y:-190)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
