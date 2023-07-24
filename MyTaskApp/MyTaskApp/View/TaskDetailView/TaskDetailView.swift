//
//  TaskDetailView.swift
//  MyTaskApp
//
//  Created by Ravi Dwivedi on 24/07/23.
//

import SwiftUI

struct TaskDetailView: View {
    
    
    @ObservedObject var taskViewModel:TaskViewModel
    @Binding var showTaskDetailView:Bool
    @Binding var selectedTask:Task
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                List{
                    Section(header: Text("Task Detail")) {
                        TextField("Task Name", text: $selectedTask.name)
                        TextEditor(text: $selectedTask.description)
                        Toggle("Mark Complete",isOn: $selectedTask.isCompleted)
                    }
                    Section(header: Text("Task date/time ")) {
                        DatePicker("Task date", selection: $selectedTask.finishedDate)
                    }
                    
                    Section{
                        Button{
                            
                            print("Delete task")
                        }
                    label:{
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        
                    }
                    }
                    
                    
                }.navigationTitle("Task Detail")
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button{
                                showTaskDetailView.toggle()
                                
                                
                            }label:{
                                Text("Cancel")
                            }
                            
                        }
                    }
                
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                print("Task updated successfully")
                                
                            }label:{
                                Text("Update")
                            }
                            
                        }
                    }
            }
        }
        
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskViewModel: TaskViewModel(), showTaskDetailView: .constant(false), selectedTask: .constant((Task.createMockTasks().first!)))
        
    }
}
