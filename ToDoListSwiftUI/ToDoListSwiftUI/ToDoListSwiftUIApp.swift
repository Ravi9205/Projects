//
//  ToDoListSwiftUIApp.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 15/05/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListSwiftUIApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
