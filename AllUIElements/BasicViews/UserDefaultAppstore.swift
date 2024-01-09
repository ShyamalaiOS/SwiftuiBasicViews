//
//  UserDefaultAppstore.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 09/01/24.
//

import SwiftUI

struct UserDefaultAppstore: View {
    @AppStorage("TapCount") private var tapCount : Int = 0
//   @State private var tapCount : Int = 0
    var body: some View {
        VStack{
            List{
                ForEach(0..<tapCount,id: \.self){ index in
                    Text("Row \(index)")
                }
            }
            Button("Tap the button to increase count"){
                tapCount += 1
                print("tapCount",tapCount)
            }
        }
    }
}

#Preview {
    UserDefaultAppstore()
}
