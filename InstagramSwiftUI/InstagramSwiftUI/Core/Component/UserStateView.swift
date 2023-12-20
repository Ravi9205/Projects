//
//  UserStackView.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 29/09/23.
//

import SwiftUI

struct UserStateView: View {
    
    let value:Int
    let title:String
    var body: some View {
    
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
            
            
        }
        .frame(width:80)

    }
}

struct UserStackView_Previews: PreviewProvider {
    static var previews: some View {
        UserStateView(value: 12, title:"Follower")
    }
}
