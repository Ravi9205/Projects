//
//  APIManager.swift
//  Airbnb
//
//  Created by Ravi Dwivedi on 12/10/23.
//

import Foundation
import UIKit





final class APIService{
    static let shared = APIService()
    private init(){}
    
    
    
    public func getListing(url:URL?,completion:@escaping(Result<[AirbnbListing],Error>)->Void){
        
        guard let url = url else {
            return
        }
        
        let urlReqest = URLRequest(url: url)
        let task =  URLSession.shared.dataTask(with: urlReqest) { data, _, error in
            
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            do{
                let resposne =  try JSONDecoder().decode(AirbnbListingResponse.self, from: data)
                completion(.success(resposne.results))
            }
            
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


