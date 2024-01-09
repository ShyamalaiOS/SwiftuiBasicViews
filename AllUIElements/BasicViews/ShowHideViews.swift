//
//  ShowHideViews.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 09/01/24.
//

import SwiftUI

struct ShowHideViews: View {
    @State var showSecondView = false
    var body: some View {
        Button("Show Second View") {
            showSecondView.toggle()
        }
        .sheet(isPresented: $showSecondView, content: {
            SecondView()
        })
    }
}

struct SecondView : View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Hello Second View")
        Button("Dismiss")
        {
            dismiss()
        }
    }
}

#Preview {
    ShowHideViews()
}
