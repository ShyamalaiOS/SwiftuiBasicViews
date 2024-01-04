//
//  Loops.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 04/01/24.
//

import SwiftUI

struct Loops: View {
    let student = ["s","Harry","Hermione","Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
       NavigationStack
        {
            Form{
                Section{
                    ForEach(0..<10){ number in
                            Text("Row \(number)")
                    }
                }
                Section{
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(student,id:\.self){
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("Loop")
        }
    }
}

#Preview {
    Loops()
}
