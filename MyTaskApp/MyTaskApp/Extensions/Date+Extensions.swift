//
//  Date+Extensions.swift
//  MyTaskApp
//
//  Created by Ravi Dwivedi on 20/07/23.
//

import Foundation


extension Date{
    
    func toString()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let result = dateFormatter.string(from: self)
        return result
    }
}
