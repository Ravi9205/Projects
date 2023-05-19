//
//  ToDoListItemView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 15/05/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    @FirestoreQuery var items:[ToDoListItemModel]

    
    init(userId:String){
        self._items = FirestoreQuery(collectionPath:"users/\(userId)/todos")
    }
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button{
                                //Delete Action
                                viewModel.delete(id: item.id)
                                
                            }label:{
                                //Label
                                Text("Delete")
                                    .background(.red)
                            }
                        }
                    
                    
                }
                .listStyle(PlainListStyle())
                
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                }
            label:{
                
                // Label Name
                Image(systemName:"plus")
            }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId:"123")
    }
}
