//
//  HomeView.swift
//  MyTaskApp
//
//  Created by Ravi Dwivedi on 20/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var taskViewModel:TaskViewModel = TaskViewModel()
    @State private var pickerFileters:[String] = ["Active","Completed"]
    @State private var defaultPcikerSelectedItem:String = "Active"
    @State private var showAddNewTaskView:Bool = false
    @State private var showTaskDetailView:Bool = false
    @State private var selectedTask: Task = Task(id: 0, name: "", description:"", isCompleted: false, finishedDate: Date())
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Picker("Picker filter",selection: $defaultPcikerSelectedItem){
                    ForEach(pickerFileters,id:\.self){
                        Text($0)
                    }
                    
                }
                .pickerStyle(.segmented)
                    .onChange(of: defaultPcikerSelectedItem) { newValue in
                        taskViewModel.getTasks(isActive: defaultPcikerSelectedItem == "Active")
                    }
        
                List(taskViewModel.task,id:\.id){ task in
                    VStack(alignment:.leading){
                        Text(task.name)
                            .font(.title)
                        
                        HStack{
                             Text(task.description)
                                .font(.subheadline)
                                .lineLimit(2)
                            Spacer()
                            Text(task.finishedDate.toString()).font(.subheadline)
                            
                        }
                    }
                    .onTapGesture {
                        selectedTask = task
                        showTaskDetailView.toggle()
                    }
                    
                }.onAppear{
                    taskViewModel.getTasks(isActive: true)
                }.listStyle(.plain)
                    .navigationTitle("Home")
                    
                    .toolbar{
                        ToolbarItem(placement:.navigationBarTrailing){
                            
                            Button{
    
                                showAddNewTaskView = true
                                
                            }
                            label:{
                                Image(systemName:"plus")
                            }
                        }
                    }
                    .sheet(isPresented:$showAddNewTaskView) {
                        
                        AddTaskView(taskViewModel: taskViewModel, showAddTaskView: $showAddNewTaskView)
                        
                    }
                
                    .sheet(isPresented:$showTaskDetailView) {
                        
                       TaskDetailView(taskViewModel: taskViewModel, showTaskDetailView: $showTaskDetailView, selectedTask: $selectedTask)
                        
                    }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
