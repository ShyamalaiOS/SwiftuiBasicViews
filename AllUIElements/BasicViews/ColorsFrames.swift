//
//  ColorsFrames.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 06/01/24.
//

import SwiftUI

struct ColorsFrames: View {
    var body: some View {
        ZStack{
            Color.yellow
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            //                .background(.red)
            //        }.background(.red)
            ZStack{
                
                VStack(spacing:20){
                    Color.red
                    Color.green
                }
                Text("Your Content")
                    .foregroundStyle(.secondary)
                    .padding(30)
                    .background(.ultraThinMaterial)
            }
        }//.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
        .ignoresSafeArea()
    }
}

#Preview {
    ColorsFrames()
}
