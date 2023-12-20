//
//  AirbnbListingViewModel.swift
//  Airbnb
//
//  Created by Ravi Dwivedi on 27/10/23.
//

import Foundation


class AirbnbListingViewModel:ObservableObject {
    
    @Published var listings:[AirbnbListing] = []
    
    public  func  fetchListings(){
        
        APIService.shared.getListing(url: URL(string: APIURL.getURL(type: .dataListURL))) { [weak self] result in
            switch result{
            case .success(let models):
                DispatchQueue.main.async {
                    self?.listings = models
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
}
