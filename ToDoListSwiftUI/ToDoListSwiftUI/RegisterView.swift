//
//  RegisterView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 15/05/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack{
            //Header
            HeaderView(title:"Register", subtitle:" Start Organising TODOS", angle: -15, backgroundColor: .orange)
            
            
            Form{
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    
                }
                
                TextField("Full Name",text: $viewModel.fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .disableAutocorrection(true)
                
                TextField("Email Address",text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                SecureField("Password",text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButtonView(title:"Register",background: .green)
                {
                    // Attempt of Register New User
                    viewModel.register()
                }
                
            }
            .offset(y:-50)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
