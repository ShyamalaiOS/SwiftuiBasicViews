//
//  Buttons.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 07/01/24.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        Button("Delete Selection"){
            print("Delete button pressed")
        }
        
        Button("External action", action: buttonPress)
        Button("Destrictive Button", role: .destructive, action: buttonPress)
        Button("Hello Bordered Button"){}
            .buttonStyle(.bordered)
        Button("Hellp BorderedProminent"){}
            .buttonStyle(.borderedProminent)
            .tint(.red)
        
        Button(action: {
            print("Custom Button")
        }, label: {
            Text("Custom Button")
                .padding(20)
                .foregroundColor(.white)
                .background(Color.primary)
        })
        
        Button(action: {
            print("Image Button")
        }, label: {
            Image(systemName: "pencil")
        }).frame(width: 100,height: 100)
        
        Button("Edit", systemImage: "pencil") {
            print("Image with title")
        }
        
        Button{
            print("Custom ImageButton")
        }label: {
            Label("Edit Image",systemImage: "pencil")
                .padding()
                .foregroundColor(.orange)
                .background(.blue)
        }.buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
    }
    
    func buttonPress(){
        print("External button press function")
    }
}

#Preview {
    Buttons()
}
