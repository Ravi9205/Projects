//
//  ToDoListItemView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 15/05/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItemModel
    
    var body: some View {
       
        
        HStack{
            
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
                
            }
            Spacer()
            
            Button{
                //Action
                viewModel.toggleIsDone(item: item)
                
            }label:{
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let newId = UUID().uuidString
        let newItem = ToDoListItemModel(id: newId,
                                        title:"",
                                        dueDate: Date().timeIntervalSince1970,
                                        createdDate: Date().timeIntervalSince1970,
                                        isDone: false)
        ToDoListItemView(item: newItem)
    }
}
