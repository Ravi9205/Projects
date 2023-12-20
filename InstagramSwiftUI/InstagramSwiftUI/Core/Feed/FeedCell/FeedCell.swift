//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by Ravi Dwivedi on 02/10/23.
//

import SwiftUI

struct FeedCell: View {
    
    let post:UserPost
    var body: some View {
        
        VStack{
            
            //Image && UserName
            HStack{
                NavigationLink{
                    UserProfileView(user: post.user)
                }
                
              label:{
                
                Image(post.user?.profileImage ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(post.user?.fullName ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
                
            }
            .padding(.leading)
            .foregroundColor(.black)
            
            //Post Image
            
            Image(post.imageURL)
                .resizable()
                .scaledToFill()
                .frame(height:400)
                .clipShape(Rectangle())
            
            //ActionButtons
            HStack(spacing:16){
                //Like
                Button{
                    
                    
                }label:{
                    
                    Image(systemName:"heart")
                        .imageScale(.large)
                    
                }
                
                //Message
                Button{
                    
                    
                }label:{
                    Image(systemName:"bubble.right")
                        .imageScale(.large)
                    
                    
                }
                //Share
                Button{
                    
                    
                }label:{
                    Image(systemName:"paperplane")
                        .imageScale(.large)
                    
                }
                Spacer()
                
            }
            .padding(.leading,8)
            .padding(.top,4)
            .foregroundColor(.black)
            
            
            
            //Likes Labels
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            
            
            //Caption Label
            
            HStack{
                Text(post.user?.userName ?? "").fontWeight(.semibold) +
                Text(" " + post.caption)
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.leading,8)
            .padding(.top,1)
            .font(.footnote)
            
            
            Text(" 6h ago")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundColor(.gray)
            
            
        }
        
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: UserPost.mockUserPostData[0])
    }
}
