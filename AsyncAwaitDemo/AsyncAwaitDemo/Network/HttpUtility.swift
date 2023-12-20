//
//  HttpUtility.swift
//  AsyncAwaitDemo
//
//  Created by Ravi Dwivedi on 25/07/23.
//

import Foundation


protocol NetworkOperation{
    func performOperation<T:Decodable>(request:URLRequest,response:T.Type) async throws -> T
}



enum HttpError:Error
{
    case nonSuccessfulStatusCode
    case nodata
    case noInternetConnection
    case inValidURL
}


final class HttpUtility:NetworkOperation{
    static let shared = HttpUtility()
    private init(){}
    
    
    func performOperation<T:Decodable>(request: URLRequest, response: T.Type) async throws -> T {
        do {
            let (serverData,serverUrlResponse) = try await URLSession.shared.data(for: request)
            guard let httpStatusCode = (serverUrlResponse as? HTTPURLResponse)?.statusCode, (200...209).contains(httpStatusCode) else {
                throw HttpError.nonSuccessfulStatusCode
            }
            return try JSONDecoder().decode(response.self, from: serverData)
        }
        catch{
            throw error
        }
    }
}
