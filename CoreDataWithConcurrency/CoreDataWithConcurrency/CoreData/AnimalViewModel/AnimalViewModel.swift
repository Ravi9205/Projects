//
//  AnimalViewModel.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 26/07/23.
//

import Foundation



struct AnimalViewModel{
    
    private let _cdAnimalDataRepository:AnimalDataRepository = AnimalDataRepository()
    private let _animalApiRepositry:AnimalApiRepositry = AnimalApiRepositry()
    
    func getAnimalRecords(completionHandler:@escaping(Array<Animal>?)->Void){
        
        
        _cdAnimalDataRepository.getAnimalRecords { response in
            
            if (response != nil && response?.count != 0) {
                //return response to the viewController
                completionHandler(response)
            }
            else
            {
                //call the Api and get the data and insert it into database
                _animalApiRepositry.getAnimalRecords { response in
                    if (response != nil && response?.count != 0) {
                        _ = _cdAnimalDataRepository.batchInsertAnimalRecords(records: response!)
                        completionHandler(response)
                    }
                }
            }
        }
    }
}
