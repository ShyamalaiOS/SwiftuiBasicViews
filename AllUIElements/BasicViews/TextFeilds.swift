//
//  TextFeilds.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 04/01/24.
//

import SwiftUI

struct TextFeilds: View {
    @State private var name = ""
    @State private var checkAmount = 0.0
    @State private var numberofpeople = 0
    @State private var tipsPercent = 0
    @FocusState private var amountisFocused : Bool
    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter your name", text: $name)
                Text("Entered Name is : \(name)")
                Section{
                    TextField("HEllo", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).focused($amountisFocused)
                }
                Section{
                    Text(checkAmount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
                    Picker("Number of people", selection: $numberofpeople) {
                        ForEach(0..<10){
                            Text("\($0) People")
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section{
                    Picker("Select Percentage", selection: $tipsPercent) {
                        ForEach(0..<10){
                            Text($0,format:.percent)
                        }
                    }.pickerStyle(.segmented)
                }
                
            }
            .navigationTitle("Wesplit")
            .toolbar {
                if amountisFocused {
                    Button("Done") {
                        amountisFocused = false
                    }
                }
            }
        }
       
    }
}

#Preview {
    TextFeilds()
}
