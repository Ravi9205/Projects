//
//  RequestError.swift
//  MVVMDemoUsingLogin
//
//  Created by Ravi Dwivedi on 17/07/23.
//

import Foundation



enum RequestError:Error{
    case inValidURL
    case unauthorized
    case noResponse
    case decodeFail
    case unexpectedStatusCode
    case unknown
    case noInternet
    case sessionError(error:Error)
    
    var customMessage:String {
        switch self {
        case .inValidURL:
            return "Invalid URL"
        case .unauthorized:
            return "Authorized access"
        case .noResponse:
            return "No response form the server"
        case .decodeFail:
            return "unable to decode the response"
        case .unexpectedStatusCode:
            return "unexpected status code"
        case .unknown:
            return "unknown response error"
        case .noInternet:
            return "No internet connect please checl your internet connection"
        case .sessionError(error: let error):
            return error.localizedDescription
        }
        
    }
}
