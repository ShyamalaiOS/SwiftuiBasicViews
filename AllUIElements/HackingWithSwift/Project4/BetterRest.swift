//
//  BetterRest.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 08/01/24.
//

import SwiftUI

struct BetterRest: View {
    @State private var wakeupTime = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    var body: some View {
        NavigationStack{
            Form{
                Text("When do you want to wakeup ?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeupTime,displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Section{
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Desired amount of sleep")
                            .font(.headline)

                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                }
                
                Text("Desired amount of cups")
                    .font(.headline)
                
                Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...10)
            }
            .navigationTitle("Better Rest")
            .toolbar{
                Button("Calculate") {
                    print("Calculate Sleep time")
                }
            }
        }
    }
}

#Preview {
    BetterRest()
}
