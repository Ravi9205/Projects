//
//  AuthResource.swift
//  AsyncAwaitDemo
//
//  Created by Ravi Dwivedi on 25/07/23.
//

import Foundation




struct AuthResource{
    
    func getToken() async throws -> AuthReponse {
        
        guard let url = Service.token.httpURL else{
            throw HttpError.inValidURL
        }
        
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = HttpMethod.get.rawValue
        
        do
        {
            return try await HttpUtility.shared.performOperation(request: urlRequest, response: AuthReponse.self)
        }
        catch {
            throw error
        }
    }
}
