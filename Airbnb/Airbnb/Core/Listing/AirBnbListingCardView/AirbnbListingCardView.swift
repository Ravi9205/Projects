//
//  ListingCardView.swift
//  Airbnb
//
//  Created by Ravi Dwivedi on 12/10/23.
//

import SwiftUI

struct AirbnbListingCardView: View {
    
    let model:AirbnbListing
    
    var body: some View {
        
        HStack{
            
            AsyncImage(url: URL(string: model.thumbnail_url ?? ""))
                .frame(width: 100, height: 100)
                .scaledToFit()
                .clipped()
            

            VStack{
                
                Text(model.name ?? "")
                    .font(.title3)
                    .lineLimit(1)
                
                Text(model.description ?? "")
                    .font(.body)
                    .foregroundColor(Color(.secondaryLabel))
                    .lineLimit(3)
            }
            
        }
        
    }
}


    
