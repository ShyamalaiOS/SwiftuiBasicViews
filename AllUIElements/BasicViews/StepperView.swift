//
//  StepperView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 07/01/24.
//

import SwiftUI

struct StepperView: View {
    @State private var sleepAmount = 8.0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Stepper("\(sleepAmount) Hours", value: $sleepAmount)
        Stepper("\(sleepAmount) Hours", value: $sleepAmount,in: 4...12)
        Stepper("\(sleepAmount) Hours", value: $sleepAmount,in: 4...12,step: 0.25)
    }
}

#Preview {
    StepperView()
}
