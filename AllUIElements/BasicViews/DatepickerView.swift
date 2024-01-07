//
//  DatepickerView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 07/01/24.
//

import SwiftUI

struct DatepickerView: View {
    @State private var wakeUp = Date.now + 1
    var tomorrow =  Date.now.addingTimeInterval(86400)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        DatePicker("Please Enter a Date",selection: $wakeUp)
        DatePicker("",selection: $wakeUp)
            .labelsHidden()
        
        DatePicker("",selection: $wakeUp,displayedComponents: .date)
            .labelsHidden()
        
        DatePicker("",selection: $wakeUp,displayedComponents: .hourAndMinute)
            .labelsHidden()
        
        
        DatePicker("",selection: $wakeUp,in:Date.now...tomorrow, displayedComponents: .date)
            .labelsHidden()
        
        Text(Date.now.formatted(date: .long, time: .shortened))
        
        Text(Date.now,format: .dateTime.day().month().year())
    
    }
}

#Preview {
    DatepickerView()
}
