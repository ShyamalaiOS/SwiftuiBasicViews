//
//  ContentView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome All in SwiftUI world")
            Spacer(minLength: 20)
            
            Spacer(minLength: 20)
            Text("Model : MacbookPro M3 pro")
            Text("Owned on : 23/12/2023 at 11:22AM")
            Text("Owner: SHYAMALA RAMANATHAN")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
