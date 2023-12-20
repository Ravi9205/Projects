//
//  AnimalApiRepository.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 26/07/23.
//

import Foundation



struct AnimalApiRepositry:AnimalRepositry{
    
    func getAnimalRecords(completionHandler: @escaping (Array<Animal>?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: ApiResource.animalResource) { data, urlResponse, error in
            
            guard let data = data , error == nil else {
                return
            }
            do {
                let result =   try  JSONDecoder().decode(AnimalResponse.self, from: data)
                guard result.errorMessage?.isEmpty == false else {
                    print("Error occured please conncet admin")
                    return
                }
                completionHandler(result.animals)
                
            }
            catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        task.resume()
    }
}
