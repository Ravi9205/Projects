//
//  PopOverMenu.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 17/11/23.
//

import SwiftUI

struct PopOverMenu: View {
    @State var showingChatHistory:Bool = false
    @State var showingSettings:Bool = false
    @State var newChat:Bool = false
    @State private var searchText = ""
    @Binding var conversation_id:String?
    @Binding var isChatHistory:Bool
    @ObservedObject var vm: ViewModel

    
    
    var body: some View {
        
        
        ZStack(alignment: .topLeading){
            
            Menu{
                
                Button{
                    print("New Chat Tapped Dississ view")
                    self.newChat = true
                }
        
                
            label:{
                Label("New Chat",systemImage:"plus")
            }
                
                Button{
                    print("History Tapped Dississ view")
                    self.showingChatHistory = true
                }
                
                
            label:{
                Label("History",systemImage:"clock.arrow.circlepath")
            }
                
            Button{
                print("Settings Tapped Dississ view")
                self.showingSettings = true
                    
            }
                
            label:{
                Label("Settings",systemImage:"gear.circle.fill")
            }
           
        }
        label:{
            Label("",image:"Threedot")
            Spacer()
        }
        .cornerRadius(10)
        .foregroundColor(.secondary)
        }
        .padding(.leading,10)
        
        //MARK:- Chat History
        .popover(isPresented: $showingChatHistory){
            ChatHistoryView(isChatHistory: $isChatHistory, conversation_id:$conversation_id, vm: vm)
            
        }
        
        //MARK:- Settings
        .popover(isPresented: $showingSettings){
              SettingView()
            
        }
    }
}



//struct PopOverMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        PopOverMenu(chatHistroy: .constant(ChatHistoryModel(conversation_id: "", prompt: "", message_id: "", response: "")), isChatHistory: .constant(false))
//    }
//}
