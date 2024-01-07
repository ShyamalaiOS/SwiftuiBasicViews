//
//  ViewsAndModifiers.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 07/01/24.
//

import SwiftUI

struct ViewsAndModifiers: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Views and Modifiers"){
            
        }.background(.purple)
            .frame(width: 200,height: 200)
        
        Button("Views and Modifiers"){
            
        }
            .frame(width: 200,height: 200).background(.red)
        Text("Hello World")
            .padding()
            .background(.pink)
            .padding()
            .background(.yellow)
            .padding()
            .background(.mint)
        
        Button("Conditional Modifer"){
            useRedText.toggle()
        }.foregroundStyle(useRedText ? .red : .yellow)
        
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        
        VStack {
            Text("Gryffindor")
                .blur(radius: 5)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 0)
        
    }
}

#Preview {
    ViewsAndModifiers()
}
