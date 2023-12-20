//
//  EmployeeViewModel.swift
//  AsyncAwaitDemo
//
//  Created by Ravi Dwivedi on 25/07/23.
//

import Foundation


struct EmployeeViewModel{
    
    private let authResponse =  AuthResource()
    private let employeeResource = EmployeeResource()
    
    
    func getPayroll() async throws ->[EmployeePayroll] {
        do{
            let authResponse = try await authResponse.getToken()
             return try await employeeResource.getPayroll(token: authResponse.token)
        }
        catch let serviceError{
            throw serviceError
        }
    }
}
