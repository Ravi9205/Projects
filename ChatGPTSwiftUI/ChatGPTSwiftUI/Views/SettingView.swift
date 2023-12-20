//
//  SettingView.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 20/11/23.
//

import SwiftUI


struct SettingView: View {
    
    
    var body: some View {
       
        NavigationView{
            
            List(1...1,id:\.self){ item in
            
            NavigationLink {
                    
                }
            label: {
                
                Text("Colour Scheme")
                    .padding()
                    .font(.headline)
                
            }
                
            NavigationLink{
                    
                }
            label:{
                Text("Privacy")
                    .padding()
                    .font(.headline)
                
            }
                
                
            NavigationLink{
                    
                }
            label:{
                Text("Terms of Use")
                    .padding()
                    .font(.headline)
                
            }
                
                
            NavigationLink{
            
               // Link("VISA FAQ", destination: URL(string: "https://investor.visa.com/investor-resources/faq/default.aspx")!)

                
                }
            label:{
                Text("FAQ")
                    .padding()
                    .font(.headline)
                
            }
                
                
            NavigationLink{
                    
                }
            label:{
                Text("Resources")
                    .padding()
                    .font(.headline)
                
            }
        }
        .navigationTitle("Settings")
       }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
