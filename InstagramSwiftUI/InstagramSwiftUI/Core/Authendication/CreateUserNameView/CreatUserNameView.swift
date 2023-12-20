//
//  CreatUserNameView.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 03/10/23.
//

import SwiftUI

struct CreatUserNameView: View {
    @State private var userName = ""
    @Environment (\.dismiss) var dismiss
    
    
    var body: some View {
        
        VStack(spacing:12){
            Text("Create UserName")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top,50)
            
            Text("You'll use this email to sign in to your acount")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            
            TextField("UserName", text:$userName)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            
            NavigationLink{
                CreatePasswordView()
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

struct CreatUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreatUserNameView()
    }
}
