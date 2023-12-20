//
//  SignUpView.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 03/10/23.
//

import SwiftUI

struct SignUpView: View {
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        
        VStack(spacing:12){
            Spacer()
            
            Text("Welcome to instagram,insta_ravidwivedi")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top,50)
            
            Text("Click below to complete the registration, and start using Instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            Button{
                print("Complete Sign Up Process")
            }
        label:{
            Text("Complete Sign Up")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
