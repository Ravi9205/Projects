//
//  AnimalDataRepository.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 26/07/23.
//

import Foundation
import CoreData



struct AnimalDataRepository:AnimalCoreDataRepository{

    //MARK:- Insert Operation insert Animal record
    func insertAnimalRecords(records: Array<Animal>) -> Bool {
       print("Insert Operations")
        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateMangedContext in
            records.forEach { animalRecord in
                let cdAnimal = CDAnimal(context: privateMangedContext)
                cdAnimal.id = UUID()
                cdAnimal.name = animalRecord.name
                cdAnimal.image = animalRecord.image
            }
            
            if (privateMangedContext.hasChanges) {
                try? privateMangedContext.save()
                debugPrint("AnimalDataRepository: Insert record operation is completed")

            }
        }
       return true
    }
    
    
    //MARK:- Batch Insert Animal Records
    func batchInsertAnimalRecords(records: Array<Animal>) -> Bool {
        PersistentStorage.shared.printDocumentDirectoryPath()
        
        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateManagedContext in
            //batch insert
            let request = self.createBatchInsertRequest(records: records)
            
            do{
                try privateManagedContext.execute(request)
            }
            catch let error{
                print(error.localizedDescription)
            }
        }
        return true
    }
    
    
    //MARK:- Create Batch request to insert Records into Core data
    private func createBatchInsertRequest(records:Array<Animal>) -> NSBatchInsertRequest{
        
        let totalCount = records.count
        var index = 0
        let batchInsert = NSBatchInsertRequest(entity: CDAnimal.entity()) { (managedObject: NSManagedObject) -> Bool in
            
            guard index < totalCount else { return true}
            
            if let animal = managedObject as? CDAnimal {
                let data = records[index]
                animal.id = UUID()
                animal.name = data.name
                animal.image = data.image
            }
            
            index += 1
            return false
            
        }
        
        return batchInsert
    }
    
    
    //MARK:-Fetch Operation Animal Record
    func getAnimalRecords(completionHandler: @escaping (Array<Animal>?) -> Void) {
        PersistentStorage.shared.printDocumentDirectoryPath()
        
        let result = PersistentStorage.shared.fetchManageObject(managedObject: CDAnimal.self)
        
        var animals:Array<Animal> = []
        
        result?.forEach({ cdAnimal in
            animals.append(cdAnimal.convertToAnimal())
        })
    }
}
