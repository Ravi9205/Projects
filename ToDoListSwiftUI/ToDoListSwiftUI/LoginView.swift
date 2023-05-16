//
//  LoginView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 15/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var emailText = ""
    @State var passwordText = ""
    
    var body: some View {
        
        NavigationView{
            VStack{
                // Header
                HeaderView()
                
                //Login  Form
                
                Form{
                    TextField("Email Address",text:$emailText)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password ",text:$passwordText)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button{
                        // Attemp to Login
                        
                    }label:{
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            Text("Login")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    
                }
                
                
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
