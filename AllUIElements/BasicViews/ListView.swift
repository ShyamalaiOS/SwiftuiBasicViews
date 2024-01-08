//
//  ListView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 08/01/24.
//

import SwiftUI

struct ListView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List {
            Section("Section 1"){
                Text("Static Rows 1")
                Text("Static Rows 2")
                Text("Static Rows 3")
                Text("Static Rows 4")
            }
            Section("Section 2"){
                ForEach(1..<10) { num in
                    Text("Dynamic Rows \(num)")
                }
            }
            Section{
                ForEach(people,id: \.self){
                    Text($0)
                }
            }
            Section("Section 3"){
                Text("Static Rows 5")
            }
        }.listStyle(.grouped)
    }
}

#Preview {
    ListView()
}
