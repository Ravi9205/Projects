//
//  ListingImageCarousalView.swift
//  AirBnbClone
//
//  Created by Ravi Dwivedi on 02/11/23.
//

import SwiftUI

struct ListingImageCarousalView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        
        TabView{
            
            ForEach(images,id:\.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                
            }
        }
        .tabViewStyle(.page)
    }
}

struct ListingImageCarousalView_Previews: PreviewProvider {
    static var previews: some View {
        ListingImageCarousalView()
    }
}
