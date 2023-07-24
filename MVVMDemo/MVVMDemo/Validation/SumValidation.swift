//
//  SumValidation.swift
//  MVVMDemo
//
//  Created by Ravi Dwivedi on 03/07/23.
//

import Foundation


struct SumValidation {
    func validate(sumRequest:SumRequest) ->SumValidationResult {
        guard !sumRequest.firstNumStr.isEmpty && !sumRequest.secondNumStr.isEmpty else {
            return SumValidationResult(message:"First number field or Second number field can't  be empty", isValid: false)
        }
        return SumValidationResult(message: nil, isValid: true)
    }
}
