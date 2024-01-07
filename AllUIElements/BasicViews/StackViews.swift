//
//  StackViews.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 06/01/24.
//

import SwiftUI

struct StackViews: View {
    var body: some View {
        VStack(alignment:.leading,spacing:30){
            Spacer()
            Spacer()
            Text("Hello, World")
            Text("This ")
            
            HStack(spacing:50) {
                Text("Placeholder")
                Text("Placeholder")
            }
            Spacer()
            Spacer()
            Spacer()
            ZStack {
                Text("Hello, world!")
                Text("This is inside a stack")
            }
        }
    }
}

#Preview {
    StackViews()
}
