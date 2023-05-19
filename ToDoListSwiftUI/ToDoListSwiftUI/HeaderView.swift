//
//  HeaderView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 16/05/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title:String
    let subtitle:String
    let angle:Double
    let backgroundColor:Color
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees:angle))
            
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 50))
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
            }
            .padding(.top,30)
            
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 350)
        .offset(y:-190)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title:"", subtitle:"", angle: 15, backgroundColor: .pink)
    }
}
