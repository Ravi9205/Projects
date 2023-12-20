//
//  FeedView.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 02/10/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVStack(spacing:32){
                    ForEach(UserPost.mockUserPostData){ post in
                        FeedCell(post:post)
                        
                    }
                    
                }
                .padding(.top,10)
                
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Image("instagramlogo")
                        .resizable()
                        .frame(width: 90, height: 35)
                    
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName:"paperplane")
                        .imageScale(.large)
                }
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
