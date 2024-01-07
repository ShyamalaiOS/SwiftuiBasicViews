//
//  StackingUPButtons.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 07/01/24.
//

import SwiftUI

struct StackingUPButtons: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue,.pink,.green], startPoint: .leading, endPoint: .trailing)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                }
                
                ForEach(0..<3) { number in
                    Button {
                        print("Selected Flag \(number)")
                    } label: {
                        Image(countries[number])
                            .resizable()
                            .frame(width: 100,height: 60)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .border(.black)
                            .clipShape(.capsule)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    StackingUPButtons()
}
