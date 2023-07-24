//
//  TaskViewModel.swift
//  MyTaskApp
//
//  Created by Ravi Dwivedi on 20/07/23.
//

import Foundation




final class TaskViewModel:ObservableObject{
    
    @Published var task:[Task] = []
    
    func getTasks(isActive:Bool){
        task = Task.createMockTasks().filter({$0.isCompleted == isActive})
    }
    
}
