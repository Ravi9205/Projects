//
//  AirbnbListingsResponse.swift
//  Airbnb
//
//  Created by Ravi Dwivedi on 12/10/23.
//

import Foundation


struct AirbnbListingResponse:Codable, Equatable{
    let total_count:Int
    let results:[AirbnbListing]
    
    static func == (lhs: AirbnbListingResponse, rhs: AirbnbListingResponse) -> Bool {
        return lhs.total_count == rhs.total_count &&
        lhs.results == rhs.results
    }
}
