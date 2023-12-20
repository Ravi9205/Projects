//
//  ExploreView.swift
//  AirBnbClone
//
//  Created by Ravi Dwivedi on 01/11/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        
        NavigationView{
            
            ScrollView{
                
                SearchBarView()
                
                LazyVStack(spacing:30){
                    
                    ForEach(0...10,id:\.self) { listing in
                        
                        NavigationLink {
                            
                            ListingDetailView()
                            
                        } label: {
                            ListingItemView()
                                .frame(height:400)
                                .cornerRadius(10)
                        }

                        
                    }
                    
                }
                
            }
        }
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
