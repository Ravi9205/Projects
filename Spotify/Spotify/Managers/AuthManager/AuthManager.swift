//
//  AuthManager.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 26/05/23.
//

import Foundation


final class AuthManager {
    
    static let shared = AuthManager()
    private init(){}
    
    private var refreshingToken = false
    
    var isSigngedIn:Bool{
        return accessToken != nil
    }
    
    
    public var signInURL:URL?{
        let string = "\(Constants.baseURL)?response_type=code&client_id=\(Constants.clientID)&scope=\(Constants.scopes)&redirect_uri=\(Constants.redirectURI)&show_dialogs=TRUE"
        return URL(string: string)
        
    }
    
    private var accessToken: String?{
        return UserDefaults.standard.string(forKey:"access_token")
    }
    
    
    private var refreshToken: String?{
        return UserDefaults.standard.string(forKey:"refresh_token")
    }
    
    private var tokenExpirationDate: Date?{
        return UserDefaults.standard.object(forKey:"expirationDate") as? Date
        
    }
    
    private var shouldRefreshToken:Bool{
        
        guard let tokenExpirationDate = tokenExpirationDate else {
            return false
        }
        
        let currentDate = Date()
        let fiveMinutes:TimeInterval = 300
        return currentDate.addingTimeInterval(fiveMinutes) >= tokenExpirationDate
    }
    
    public func exchangeCodeForToken(code:String,completion:@escaping((Bool))->Void){
        
        // Get Token
        guard let url = URL(string:Constants.tokenAPIURL) else {
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value:"authorization_code"),
            URLQueryItem(name: "code", value:code),
            URLQueryItem(name: "redirect_uri", value:"https://www.iosacademy.io"),
            
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        
        let data = basicToken.data(using: .utf8)
        
        guard  let base64String = data?.base64EncodedString() else {
            completion(false)
            return
        }
        
        request.setValue("Basic\(base64String)", forHTTPHeaderField:"Authorization")
        let task =  URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
            
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            
            do {
                
                  let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                //let result = try JSONDecoder().decode(AuthResponse.self
                  //                                    , from: data)
               // self?.chacheToken(result:result)
                print("SUCCESS:\(result)")
                completion(true)
                
            }
            
            catch {
                print(error.localizedDescription)
                completion(false)
            }
        }
        task.resume()
        
    }
    
    
    //MARK:- Accounts chacheToken
    private func chacheToken(result:AuthResponse){
        //Store the ChacheToken
        UserDefaults.standard.set(result.acccess_token, forKey:"access_token")
        UserDefaults.standard.set(result.refresh_token, forKey:"refresh_token")
        UserDefaults.standard.set(Date().addingTimeInterval(TimeInterval(result.expires_in)), forKey:"expires_in")
    }
    
    
    private var onRefreshBlocks = [((String) -> Void)]()
    
    //MARK:- Supply Valid Token to be used with API Calls
    public func withValidToken(completion:@escaping (String) -> Void){
        
        guard !refreshingToken else {
            //Append the Completion
            onRefreshBlocks.append(completion)
            return
        }
        
        
        if shouldRefreshToken {
            //Refresh
            refreshIfneeded { [weak self] success in
                if success {
                    if let token = self?.accessToken{
                        completion(token)
                    }
                    
                }
            }
        }
        
        else if let token = accessToken{
            completion(token)
        }
        
    }
    
    public func  refreshIfneeded(completion:((Bool)-> Void)?){
        
        guard !refreshingToken  else {
            return
        }
        
        guard shouldRefreshToken else {
            completion?(true)
            return
        }
        
        
        guard let refreshToken = refreshToken else {
            return
        }
        
        // Get Token
        guard let url = URL(string:Constants.tokenAPIURL) else {
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "query_type", value:"refresh_token"),
            URLQueryItem(name: "refresh_token", value:refreshToken),
            
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        
        let data = basicToken.data(using: .utf8)
        
        guard  let base64String = data?.base64EncodedString() else {
            completion?(false)
            return
        }
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField:"Authorization")
        let task =  URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
            
            guard let data = data, error == nil else {
                completion?(false)
                return
            }
            
            do {
                
                //  let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let result = try JSONDecoder().decode(AuthResponse.self
                                                      , from: data)
                print("successfully refreshed:\(result)")
                self?.chacheToken(result:result)
                
                completion?(true)
                
            }
            
            catch {
                print(error.localizedDescription)
                completion?(false)
            }
        }
        task.resume()
        
    }
    
}


