//
//  AddEmailView.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 03/10/23.
//

import SwiftUI

struct AddEmailView: View {
    
    @State private var email = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing:12){
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top,50)
            
            Text("You'll use this email to sign in to your acount")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            
            TextField("Email", text:$email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink{
                CreatUserNameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
