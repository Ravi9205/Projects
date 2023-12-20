//
//  CDAnimal+CoreDataProperties.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 26/07/23.
//
//

import Foundation
import CoreData


extension CDAnimal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDAnimal> {
        return NSFetchRequest<CDAnimal>(entityName: "CDAnimal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: URL?
    @NSManaged public var name: String?

}

extension CDAnimal : Identifiable {

}
