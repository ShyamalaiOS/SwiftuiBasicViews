//
//  GradientView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 06/01/24.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        VStack{
            LinearGradient(colors: [.red,.green,.yellow], startPoint: .top, endPoint: .bottomTrailing)
           
            AngularGradient(colors: [.blue,.purple,.black,.yellow,.red,.green], center: .center)
            
            Text("Hello World")
                .background(RadialGradient(colors: [.blue, .black,.red], center: .center, startRadius: 10, endRadius: 50)
                    )
            LinearGradient(stops: [
                Gradient.Stop(color: Color(cgColor: CGColor(red: 0.1, green: 0.7, blue: 0.9, alpha: 1)), location: 0.45),
                Gradient.Stop(color: .black, location: 0.55),
            ], startPoint: .leading, endPoint: .trailing)
        }.background()
    }
}

#Preview {
    GradientView()
}
