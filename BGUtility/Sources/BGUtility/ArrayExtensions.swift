//
//  File.swift
//  
//
//  Created by Ravi Dwivedi on 25/09/25.
//

import Foundation

public extension Array {
    subscript(safeIndex index:Int) -> Iterator.Element?{
        return index >= 0 && index < endIndex ? self[index] : nil
    }
}
