//
//  Task.swift
//  MyTaskApp
//
//  Created by Ravi Dwivedi on 20/07/23.
//

import Foundation



struct Task{
    let id:Int
    var name:String
    var description:String
    var isCompleted:Bool
    var finishedDate:Date
    
    static func createMockTasks() ->[Task]{
        return [Task(id: 1, name:"Go to Gym", description:"back work", isCompleted: true, finishedDate: Date()),
                Task(id: 2, name:"Car Wash", description:"Downtown car wash center", isCompleted: true, finishedDate: Date()),
                Task(id: 3, name:"Office Work", description:"Finsh Picker module", isCompleted: false, finishedDate: Date())
        ]
    }
}
