//
//  ProfileView.swift
//  ToDoListSwiftUI
//
//  Created by Ravi Dwivedi on 18/05/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                }
                else
                {
                    Text("Loading Profile.....")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUsers()
        }
    }
    
    @ViewBuilder
    func profile(user:UserModel) -> some View{
        //Avatar View
        Image(systemName:"person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //Info User Name, Email id , Memeber since
        
        VStack(alignment: .leading){
            //Name
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
                
            }
            .padding()
            //Email
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
                
            }.padding()
            
            //Member since
            HStack{
                Text("Member since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                
            }
            .padding()
        }
        .padding()
        
        
        //SignOut
        Button("Log Out") {
            //LogOut Action
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
