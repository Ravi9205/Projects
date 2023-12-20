//
//  SearchView.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 03/10/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    var body: some View {
        
        NavigationView{
            ScrollView{
                
                LazyVStack(spacing:15){
                    ForEach(User.mockUserData){ user in
                        
                        NavigationLink {
                            UserProfileView(user: user)
                            
                        } label: {
                            
                            HStack{
                                Image("avatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:40,height:40)
                                    .clipShape(Circle())
                                
                                
                                VStack(alignment:.leading){
                                    Text(user.userName)
                                        .fontWeight(.semibold)
                                    Text(user.fullName!)
                                    
                                    
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .padding()
                            .foregroundColor(.black)
                        }
                        
                        
                    }
                    
                }
                .padding(.top,10)
                .searchable(text: $searchText,prompt:"Seach...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
