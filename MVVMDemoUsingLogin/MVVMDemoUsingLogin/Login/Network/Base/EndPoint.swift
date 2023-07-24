//
//  EndPoint.swift
//  MVVMDemoUsingLogin
//
//  Created by Ravi Dwivedi on 17/07/23.
//

import Foundation


protocol Endpoints {
    var scheme:String {get}
    var host:String {get}
    var path:String{get}
    var method:HttpMethod { get}
    var header:[String:String]? {get}
    var body:[String:String]? { get}
}

extension Endpoints{
    var scheme:String{
        return "https"
    }
    
    
    func makeURLRequest() ->URLRequest? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        guard let url = urlComponents.url else  { return nil}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        
        if let httpBody = body {
            urlRequest.httpBody = try?JSONSerialization.data(withJSONObject: httpBody, options: [])
        }
        
        return urlRequest
        
    }
    
}
