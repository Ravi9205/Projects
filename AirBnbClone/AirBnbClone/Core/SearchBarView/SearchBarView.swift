//
//  SearchBarView.swift
//  AirBnbClone
//
//  Created by Ravi Dwivedi on 01/11/23.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
      
        HStack{
            Image(systemName:"magnifyingglass")
            
            VStack(alignment:.leading,spacing:2){
                
                Text("Where to?")
                    .font(.footnote)
                Text("Anywhere - Any week - add Guests")
                    .font(.caption2)
                    .foregroundColor(.gray)
                
            }
            Spacer()
            
            Button {
                
            } label: {
                
                Image(systemName:"line.3.horizontal.decrease.circle")
                    .foregroundColor(.black)
            }

        }
          .padding(.horizontal)
          .padding(.vertical,10)
        .overlay{
                Capsule().stroke(lineWidth: 0.2)
                    .foregroundColor(Color(.systemGray4))
                    .shadow(color: .black.opacity(0.2), radius:2)

                
            }
            .padding()
        
    }
    
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
