//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Ravi Dwivedi on 12/10/23.
//

import SwiftUI

struct AirbnbListingDetailView: View {
    
    var model:AirbnbListing
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            ScrollView(.vertical){
                //Picture
                AsyncImage(url: URL(string: model.xl_picture_url ?? ""))
                    .frame(width: 400, height: 400)
                    .scaledToFill()
                    .clipped()

                
                //Info
                Text(model.name ?? "")
                    .padding()
                
                if let price = model.price {
                    Text("Nightly Rate:\(price.formatted(.currency(code:"USD")))")
                }
                
                Text("Description: \(model.description ?? "")")
                    .padding()
                Text("Summary: \(model.summary ?? "")")
                    .padding()
                Text("House Rules: \(model.house_rules ?? "")")
                    .padding()
                Text("Space: \(model.space ?? "")")
                    .padding()

                
                Text("About Your Host")
                    .font(.title2)
                    .bold()
                
                

                //Host Info
                HStack{
                    AsyncImage(url: URL(string: model.host_thumbnail_url))
                        .frame(width: 75, height: 75)
                        .scaledToFit()
                        .clipShape(Circle())
                        .clipped()

                    
                    Text(model.host_name)
                        .bold()
                    
                    
                    
                    
                }
                .padding()
                
                Text("Hosting Since: "+model.host_since)

            }
        }
        .navigationTitle(model.name ?? "Listing")
    }
}


