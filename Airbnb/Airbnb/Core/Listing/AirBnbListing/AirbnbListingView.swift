//
//  AirbnbListingView.swift
//  Airbnb
//
//  Created by Ravi Dwivedi on 12/10/23.
//

import SwiftUI

struct AirbnbListingView: View {
    
    @StateObject var viewModel = AirbnbListingViewModel()
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                if viewModel.listings.isEmpty {
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                
                else {
                    List(viewModel.listings){ listing in
                        
                        NavigationLink {
                            AirbnbListingDetailView(model: listing)
                            
                        } label: {
                            
                            AirbnbListingCardView(model: listing)
                        }
                    }
                }
            }
            .navigationTitle("Airbnb")
            
            
        }
        .onAppear {
            viewModel.fetchListings()
        }
        
    }
}

struct AirbnbListingView_Previews: PreviewProvider {
    static var previews: some View {
        AirbnbListingView()
    }
}
