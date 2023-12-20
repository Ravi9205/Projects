//
//  LoginView.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 03/10/23.
//

import SwiftUI

struct LoginView: View {
    @State private var userEmail = ""
    @State private var userPassword = ""
    var body: some View {
        
        NavigationView{
            
            VStack{
                //Logo
                Spacer()
                Image("instagramlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height:100)
                
                //TextFields
                VStack{
                    
                    TextField("Enter the user email id", text: $userEmail)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    
                    SecureField("Enter the user password", text: $userPassword)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                    
                }
                
                Button{
                    print("Forgot Password Action")
                }label:{
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                }
                .frame(maxWidth:.infinity,alignment: .trailing)
                
                Button{
                    print("Login Action")
                }label:{
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                    
                }
                .padding(.vertical)
                
                HStack{
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width/2-40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width/2-40, height: 0.5)
                    
                }
                .foregroundColor(.gray)
                
                HStack{
                    
                    Image("facebook")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                    
                }
                .padding(.top,10)
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    //Text("Sign Up")
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                }
            label:{
                HStack(spacing:3){
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
                
            }
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
