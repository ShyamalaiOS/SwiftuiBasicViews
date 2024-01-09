//
//  AtState.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 09/01/24.
//

import SwiftUI
import Observation

@Observable
class User{
    var firstName : String = "Bilbo"
    var lastName : String = "Baggins"
}

struct AtState: View {
    @State var user = User()
    var body: some View {
        TextField("User FirstName", text: $user.firstName)
            .border(.fill)
            .padding()
            .font(.title)
        TextField("User LastName", text: $user.lastName)
            .border(.fill)
            .padding()
            .font(.title)
        Text("User First name is : \(user.firstName)")
        Text("User Last name is : \(user.lastName)")
    }
}


#Preview {
    AtState()
}
