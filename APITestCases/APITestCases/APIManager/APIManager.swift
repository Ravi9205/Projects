//
//  APIManager.swift
//  APITestCases
//
//  Created by Ravi Dwivedi on 21/09/23.
//

import Foundation



final class APIManager {
    
    
    public static let shared = APIManager()
    
    private init(){}
    
    
    func makeAPIRequest(with url:URL, completion:@escaping(Result<Any, Error>)->Void){
        
        URLSession.shared.dataTask(with:url) { data, urlResponse, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let result =  try JSONSerialization.data(withJSONObject: data, options: .fragmentsAllowed)
                print("APIResponse====\(result)")
                //completion(result)
            }
            
            catch let err {
                print(err.localizedDescription)
            }
        }
        .resume()
    }
}
