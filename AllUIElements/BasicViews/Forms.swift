//
//  Form.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 04/01/24.
//

import SwiftUI

struct Forms: View {
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Text("Hello, world!")
                }
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")       
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Forms()
}
