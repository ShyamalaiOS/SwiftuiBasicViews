//
//  AlertView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 07/01/24.
//

import SwiftUI

struct AlertView: View {
    @State private var showAlert = false
    var body: some View {
        Button("Show Alert") {
            print("Showing AlertView")
            showAlert = true
        }.alert("Hello Alert World", isPresented: $showAlert) {
            Button("Dismiss",role: .destructive) {
                print("Dismiss AlertView")
            }
            Button("No",role: .destructive) {
                print("No AlertView")
            }
            Button("YEs",role: .cancel) {
                print("Yes AlertView")
            }
        }message: {
            Text("This is alert Message block")
        }
    }
}

#Preview {
    AlertView()
}
