//
//  LoginView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 15/05/23.
//

import SwiftUI

struct LoginView: View {
    
  @StateObject var viewModel = LoginViewModel()
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                // Header
                HeaderView(title:"To Do List", subtitle:"Gets Things Done", angle: 15, backgroundColor: .pink)
                
                //Login  Form
                
                Form{
                    
                    if  !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                        
                    }
            
                    TextField("Email Address",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    SecureField("Password ",text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                   
                    TLButtonView(title:"Login",background: .blue) {
                        //Attemp Login
                        viewModel.login()
                    }
                }
                .offset(y:-50)
                // Create Account
                
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an Account", destination:RegisterView())
                    
                }.padding(.bottom,50)
                
                Spacer()
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
