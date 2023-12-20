//
//  ListingDetailView.swift
//  AirBnbClone
//
//  Created by Ravi Dwivedi on 02/11/23.
//

import SwiftUI

struct ListingDetailView: View {
    
   
    
    var body: some View {
        
        ScrollView{
            ListingImageCarousalView()
                .frame(height:320)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                
                VStack(alignment:.leading){
                    
                    HStack(spacing:2){
                        
                        Image(systemName:"star.fill")
                        Text("4.86")
                        Text(" - ")
                        Text("28 Reviews")
                            .underline()
                            .fontWeight(.semibold)
                        
                        
                    }
                    .foregroundColor(.black)
                    Text("Miami, Florida")
                    
                    
                }
                .font(.caption)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            //Host Info View
            
            HStack{
                
                VStack(alignment:.leading){
                    
                    Text("Entire villa is hosted by Jhone Smith")
                        .font(.headline)
                        .font(.headline)
                        .frame(width: 200, alignment: .leading)
                    
                    
                    HStack(spacing:2){
                        
                        Text("4 Guests -")
                        Text("4  bedroom -")
                        Text("4  beds -")
                        Text("3  bath ")
                        
                        
                        
                        
                    }
                    .font(.caption)
                    
                    
                }
                .frame(width:300)
                
                Spacer()
                
                Image("male-profile-photo")
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                
            }
        }
        
    }
}

struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView()
    }
}
