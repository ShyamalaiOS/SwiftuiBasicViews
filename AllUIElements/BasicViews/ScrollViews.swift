//
//  ScrollViews.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

/*
 SwiftUI won’t wait until you scroll down to see them, it will just create them immediately.
 
 to avoid this we user LazyHstack,LazyVStack insead of Vstack and Hstack
 
 These can be used in exactly the same way as regular stacks but will load their content on-demand – they won’t create views until they are actually shown, and so minimize the amount of system resources being used
 */

import SwiftUI

struct ScrollViews: View {
    var body: some View {
        ScrollView(.vertical){
            LazyVStack(spacing:20){
                ForEach(1..<30){
                    CustomText("Row \($0)")
                        .font(.title)
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

struct CustomText : View{
    var text : String
    var body: some View{
        Text(text)
    }
    init(_ text : String){
        self.text = text
    }
}

#Preview {
    ScrollViews()
}
