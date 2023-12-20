//
//  CDAnimalExtension.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 26/07/23.
//

import Foundation



extension CDAnimal {
    func convertToAnimal() -> Animal {
        return Animal(name: self.name!, image: self.image!)
    }
}
