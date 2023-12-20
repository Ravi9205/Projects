//
//  ChatHistoryView.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 17/11/23.
//

import SwiftUI

struct ChatHistoryView: View {
    @Environment(\.presentationMode) var presentationMode
    var onDismiss: ((_ id: String) -> Void)?
    @Binding var isChatHistory:Bool
    @Binding var conversation_id:String?
    @ObservedObject var vm: ViewModel
    @StateObject var chatHistoryViewModel = ChatHistoryViewModel()
    @State private var searchIsActive = false

    
    var body: some View {
        NavigationView {
            List{
                if chatHistoryViewModel.filteredHistory.count > 0 {
                    ForEach(chatHistoryViewModel.filteredHistory,id:\.conversation_id){ history in
                        VStack(alignment: .trailing){
                            Text(history.title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .onTapGesture {
                                    presentationMode.wrappedValue.dismiss()
                                    Task{
                                        @MainActor in
                                        await vm.loadChatHistory(id:history.conversation_id )
                                }
                            }
                        }
                    }
                }
                else{
                    VStack{
                           Text("No Data Found")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.headline)
                            
                    }
                    
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
            .navigationTitle("History")
        }
        .searchable(text:$chatHistoryViewModel.searchText,placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct ChatHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHistoryView(isChatHistory: .constant(false), conversation_id: .constant(""), vm: (ViewModel(api: ChatGPTAPI(apiKey:""))))
    }
}



