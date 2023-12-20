//
//  RandomDataGenerator.swift
//  RandomGenerator
//
//  Created by Ravi Dwivedi on 20/10/23.
//

import Foundation


public class RandomDataGenerator{
    public static func string() -> String{
        return UUID().uuidString
    }
    
    public static func interger() -> Int{
        return Int(arc4random()) // It converts any number into inete
    }
}
