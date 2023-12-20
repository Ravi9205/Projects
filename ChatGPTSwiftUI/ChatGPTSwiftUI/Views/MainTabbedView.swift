//
//  MainTabbedView.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 15/11/23.
//

import SwiftUI

struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack{
            
            //MARK:- For tab selection View once if any item from the Side Menu is selected handle the redirection from here
            TabView(selection: $selectedSideMenuTab) {
               /*
                HomeView(presentSideMenu: $presentSideMenu)
                    .tag(0)
                FavoriteView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                ChatView(presentSideMenu: $presentSideMenu)
                    .tag(2)
                ProfileView(presentSideMenu: $presentSideMenu)
                    .tag(3)
                
                */
                
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
    }
}
