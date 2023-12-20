//
//  APIURL.swift
//  Airbnb
//
//  Created by Ravi Dwivedi on 12/10/23.
//

import Foundation




//https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=20&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22

//https://public.opendatasoft.com/api/explore/v2.1)/catalog/datasets/airbnb-listings/records?limit=20&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%2

//https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=20&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22

struct Constants{
    static let baseURLString = "https://public.opendatasoft.com/api/explore/v2.1"
    static let listing = "/catalog/datasets/airbnb-listings/records?limit=20&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22"
    
}

enum APIEndPoints:String{
    case dataListURL
    case productURL
}

protocol  APIURLProtocal{
     static func getURL(type:APIEndPoints) ->  String
}


private var baseURL:URL? {
    guard let url = URL(string:Constants.baseURLString) else {
        return nil
    }
    return url
}


struct APIURL:APIURLProtocal{
   static func getURL(type: APIEndPoints) -> String {
        switch type {
        case .dataListURL:
            return "\(baseURL!)" + Constants.listing
        case .productURL:
            return ""
        }
    }
}
