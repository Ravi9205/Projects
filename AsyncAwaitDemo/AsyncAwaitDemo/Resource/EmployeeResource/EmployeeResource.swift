//
//  EmployeeResource.swift
//  AsyncAwaitDemo
//
//  Created by Ravi Dwivedi on 25/07/23.
//

import Foundation


struct EmployeeResource{
    
    func getPayroll(token:String) async throws -> [EmployeePayroll]{
    
        guard let url = Service.token.payrollURL else {
            throw HttpError.inValidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethod.post.rawValue
        
        urlRequest.httpBody = createPayrollHttpBody(serviceToken: token)
        urlRequest.addValue("application/json", forHTTPHeaderField:"content-type")
        
        do{
            let serviceResponse = try await HttpUtility.shared.performOperation(request: urlRequest, response: PayrollResponse.self)
            
            guard let empPayroll = serviceResponse.data else{
                return []
            }
            return empPayroll
            
        }
        catch let serviceError{
            throw serviceError
        }
    }
    
    //MARK:-Create Http Body
    func createPayrollHttpBody(serviceToken:String) ->Data{
        return Data()
    }
    
}
