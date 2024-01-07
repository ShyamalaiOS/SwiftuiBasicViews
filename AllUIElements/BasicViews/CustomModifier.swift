//
//  CustomModifier.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 07/01/24.
//

import SwiftUI

struct CustomModifier: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .modifier(Title())
        
        Text("Used Extension")
            .capsuleTitle()
        
        Color.blue
            .frame(width: 200,height: 200)
            .waterMark(text: "Our Brands")
    }
}

struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(20)
            .foregroundColor(.white)
            .background(
                LinearGradient(colors: [.blue,.purple], startPoint: .leading, endPoint: .trailing)
            )
            .clipShape(.capsule)
    }
}

struct WaterMark : ViewModifier{
    var text : String
    func body(content: Content) -> some View {
        ZStack{
            content
            Text(text)
                .font(.title)
                .foregroundColor(.secondary)
                .padding(10)
                .background(.tint)
        }
    }
}


extension View{
    func capsuleTitle() -> some View{
        modifier(Title())
    }
    
    func waterMark(text : String) -> some View{
        modifier(WaterMark(text : text))
    }
}


#Preview {
    CustomModifier()
}
