//
//  AnimalRepository.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 26/07/23.
//

import Foundation

protocol AnimalRepositry{
    func getAnimalRecords(completionHandler:@escaping(Array<Animal>?)->Void)
}

protocol AnimalCoreDataRepository : AnimalBaseRepository {
    func insertAnimalRecords(records:Array<Animal>) -> Bool
    func batchInsertAnimalRecords(records:Array<Animal>) -> Bool
}

protocol AnimalBaseRepository {
    func getAnimalRecords(completionHandler:@escaping(_ result: Array<Animal>?)->Void)
}

protocol AnimalApiResourceRepository : AnimalBaseRepository {
    
}
