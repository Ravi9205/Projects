//
//  LoginApiResource.swift
//  APITestCasesDemo
//
//  Created by Ravi Dwivedi on 14/07/23.
//

import Foundation



struct LoginApiResource{
    
    
    func authenticateUser(request:LoginRequest,completionHandler:@escaping(_ result:LoginResponse)->()){
        
        let urlRequest = generateLoginUrlRequest(request: request)
        URLSession.shared.dataTask(with: urlRequest) { responseData, userResponse, error in
            
            guard let data = responseData ,error == nil  else {
                debugPrint("error while getting response")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(LoginResponse.self, from: data)
                completionHandler(result)
                
            }
            catch let error{
                print(error.localizedDescription)
            }
            
        }
        .resume()
    }
   
    
    
    private func generateLoginUrlRequest(request: LoginRequest) -> URLRequest{
        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/")!)
        urlRequest.httpMethod = "post"

        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch  {
            debugPrint("Encoding request body failed")
        }

        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return urlRequest
    }
    
    
    
    
}
