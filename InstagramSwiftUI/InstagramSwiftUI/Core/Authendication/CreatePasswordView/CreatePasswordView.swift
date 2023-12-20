//
//  CreatePasswordView.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 03/10/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing:12){
            Text("Create Password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top,50)
            
            Text("Your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            
            SecureField("Password", text:$password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink{
                SignUpView()
                    .navigationBarBackButtonHidden(true)
            }
        label:{
            Text("Next")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 370, height: 50)
                .background(Color(.systemBlue))
                .cornerRadius(8)
        }
        .padding(.vertical)
            Spacer()
            
        }
        
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName:"chevron.left")
                    .imageScale(.large)
                
                    .onTapGesture {
                        dismiss()
                    }
                
            }
        }
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
