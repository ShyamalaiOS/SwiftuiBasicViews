//
//  StateProperty.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 04/01/24.
//

import SwiftUI

struct StateProperty: View {
    @State var tapcount : Int = 0
    var body: some View {
        Button("Tap Count: \(tapcount)") {
            tapcount += 1
        }
    }
}

#Preview {
    StateProperty()
}
