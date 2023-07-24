//
//  AddTaskView.swift
//  MyTaskApp
//
//  Created by Ravi Dwivedi on 24/07/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var taskViewModel:TaskViewModel
    @State private var taskToAdd:Task = Task(id: 0, name:"", description:"", isCompleted: false, finishedDate: Date())
    
    @Binding var showAddTaskView:Bool
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                List{
                    Section(header: Text("Task Detail")) {
                        TextField("Task Name", text: $taskToAdd.name)
                        TextEditor(text: $taskToAdd.description)
                    }
                    Section(header: Text("Task date/time ")) {
                        DatePicker("Task date", selection: $taskToAdd.finishedDate)
                    }
                                                            
                    
                }.navigationTitle("Add Task")
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button{
                                print("Cancel Button Tapped")
                                showAddTaskView = false
                                
                            }label:{
                                Text("Cancel")
                            }
                            
                        }
                    }
                
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                print("Add Button Tapped")
                                
                            }label:{
                                Text("Add")
                            }
                            
                        }
                 }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskViewModel: TaskViewModel(), showAddTaskView: .constant(false))
    }
}
