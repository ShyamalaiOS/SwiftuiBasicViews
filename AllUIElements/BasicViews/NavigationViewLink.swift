//
//  NavigationViewLink.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import SwiftUI

struct NavigationViewLink: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Tap Me", destination: {
                    Text("This is Next Screen")
            })
            
            NavigationLink(destination: {
                NavigationViewLink()
            }, label: {
                Image("Germany")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1000,height: 50)
                    .padding()
            })
            
            NavigationLink(destination: {
                Text("Navigate from VStack")
            }, label: {
                VStack{
                    Text("This is Title")
                    Text("This is conetent")
                    Image(systemName: "plus")
                }
                .font(.largeTitle)
                .foregroundColor(.red)
            })
            
            
            List{
                ForEach(0..<10){ num in
                    NavigationLink {
                        Text("Navigate from List view")
                    } label: {
                        Text("Row \(num)")
                    }

                }
            }
                .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    NavigationViewLink()
}
