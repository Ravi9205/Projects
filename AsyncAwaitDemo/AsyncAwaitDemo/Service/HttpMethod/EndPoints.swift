//
//  EndPoints.swift
//  AsyncAwaitDemo
//
//  Created by Ravi Dwivedi on 25/07/23.
//

import Foundation



protocol EndPointsTypes{
    var scheme:String {get}
    var url:URL? { get}
    var path:String { get}
    var baseURL:String{get}
    var method:HttpMethod {get}
    var header:[String:String]? {get}
    var body:Encodable?{get}
}


enum EndpointItems{
    case apiToken
    case employeePayroll(empData:Employee)
    case employee
}



extension EndpointItems:EndPointsTypes{
    var url: URL? {
        return URL(string:"\(baseURL)")
    }
    
    var path: String {
        switch self{
        case .apiToken:
            return "/authToken"
        case .employeePayroll:
            return "/getEmployeePayroll"
        case .employee:
            return "/getAllEmployee"
        }
        
    }
    
    var baseURL: String {
        switch self{
        case .apiToken:
            return "\(scheme)\(path)"
        case .employeePayroll:
            return "\(scheme)\(path)"
        case .employee:
            return "\(scheme)\(path)"
            
        }
    }
    
    var method: HttpMethod {
        switch self{
        case .apiToken:
            return   .get
        case .employeePayroll:
            return  .post
        case .employee:
            return  .get
        }
    }
    
    var header: [String : String]? {
        return EndpointItems.commonHeaders
    }
    
    var body: Encodable? {
        switch self{
        case .apiToken:
            return nil
        case .employeePayroll:
            return nil
        case .employee:
            return nil
        }
        
    }
    
    var scheme:String{
        return "https://fakeapiStorm.com"
    }
    
    
    
    static var  commonHeaders: [String:String]{
        return [
            "Content-Type":"application/json"
        ]
    }
}
