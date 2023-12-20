//
//  AnimalResponse.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 26/07/23.
//

import Foundation



struct AnimalResponse: Decodable {
    let errorMessage: String?
    let animals: [Animal]?

    enum CodingKeys: String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

