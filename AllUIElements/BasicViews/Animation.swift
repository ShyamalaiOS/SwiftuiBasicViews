//
//  Animation.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 08/01/24.
//

import SwiftUI


struct Animation: View {
    @State  var animationAmount = 0.5
    let letters = Array("Hello SwiftUI")
       @State private var enabled = false
       @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false

    var body: some View {
        animateButton(buttontitle: "HEllo",animationAmount: animationAmount)
//            .animation(.easeIn(duration: 0.6), value: animationAmount)
        
        
        HStack(spacing: 0) {
                   ForEach(0..<letters.count, id: \.self) { num in
                       Text(String(letters[num]))
                           .padding(5)
                           .font(.title)
                           .background(enabled ? .blue : .red)
                           .offset(dragAmount)
                           .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                   }
               }
               .gesture(
                   DragGesture()
                       .onChanged { dragAmount = $0.translation }
                       .onEnded { _ in
                           dragAmount = .zero
                           enabled.toggle()
                       }
               )
        
        ZStack {
                   Rectangle()
                       .fill(.blue)
                       .frame(width: 200, height: 200)

                   if isShowingRed {
                       Rectangle()
                           .fill(.red)
                           .frame(width: 200, height: 200)
                           .transition(.pivot)
                   }
               }
               .onTapGesture {
                   withAnimation {
                       isShowingRed.toggle()
                   }
               }
        
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -190, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 80, anchor: .topLeading)
        )
    }
}

struct animateButton : View {
    var buttontitle : String
    @State  var animationAmount = 1.0
    @State private var enabled = false
    
    var body: some View {
        
        Stepper("Stepper With animation \(animationAmount.formatted())", value: $animationAmount.animation(.spring(.smooth, blendDuration: 1)), in: 1...10)
        
        Button(buttontitle){
            animationAmount -= 1
        }.padding(10)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.capsule)
            .scaleEffect(animationAmount)
//            .blur(radius: (animationAmount - 1) * 3)
//            .animation(.default, value: animationAmount)
//            .animation(.spring(duration: 0.5,bounce: 0.9), value: animationAmount)
//            .animation(.easeInOut(duration: 2).delay(1), value: animationAmount)
//            .animation(.easeInOut(duration: 2).repeatCount(3,autoreverses: true), value: animationAmount)
            .overlay(
                Circle()
                    .stroke(.yellow)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(.easeInOut(duration: 2).repeatCount(3,autoreverses: true), value: animationAmount)
                
            )
            .onAppear {
                animationAmount = 2
            }
        
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
        
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
}

#Preview {
    Animation()
}
