//
//  PersistentStorage.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 26/07/23.
//

import Foundation
import CoreData



final class PersistentStorage{
    
    static let shared = PersistentStorage()
    private init(){}
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataWithConcurrency")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: Fetch Request for an entity record fetch
    func fetchManageObject<T:NSManagedObject>(managedObject:T.Type) -> [T]?{
        
        do{
            guard let result = try PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else { return nil}
            return result
            
        }
        catch let error{
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    //MARK: get Document Directory path
    func printDocumentDirectoryPath(){
        debugPrint(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])
    }
    
    
}
