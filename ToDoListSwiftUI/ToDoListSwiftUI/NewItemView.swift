//
//  NewItemView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 15/05/23.
//

import SwiftUI


struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented:Bool
    
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            //Add New Form
            Form{
                // Title
                TextField("Title",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                
                // Button
                TLButtonView(title:"Save", background: .pink, action: {
                    // Action
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }
                    else
                    {
                        viewModel.showAlert = true
                        
                    }
                })
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title:Text("Error"), message:Text("Please fill in all Fields and select and select due date that is today or newer"))
                
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
