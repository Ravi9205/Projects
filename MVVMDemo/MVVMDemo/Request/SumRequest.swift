//
//  SumRequest.swift
//  MVVMDemo
//
//  Created by Ravi Dwivedi on 03/07/23.
//

import Foundation


struct SumRequest {
    var firstNumStr:String
    var secondNumStr:String
    
    mutating func findSum() -> Int{
        guard let firstNum = Int(firstNumStr) else {
            return 0
        }
        guard let secondNum = Int(secondNumStr) else {
            return 0
        }
        
        let result = firstNum + secondNum
        return result
    }
}
