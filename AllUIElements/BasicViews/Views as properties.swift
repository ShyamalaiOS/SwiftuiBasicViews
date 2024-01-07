//
//  Views as properties.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 07/01/24.
//

import SwiftUI

struct Views_as_properties: View {
    let motto1 = Text("Hello Motto")
    let motto2 = Text("HEllo Motto2")
    var motto3 : some View{
        Text("Motto Text with Computed Property")
    }
    
    var spells : some View{
        VStack {
               Text("Lumos")
               Text("Obliviate")
           }
    }
    
    var spellsGroup : some View{
        Group {
               Text("Lumos")
               Text("Obliviate")
           }
    }
    
    @ViewBuilder var spellsBuilder: some View {
        Text("Lumos_spellsBuilder")
        Text("Obliviate_spellsBuilder")
    }
    
    var body: some View {
        motto1
            .foregroundStyle(.primary)
        motto2
            .font(.headline)
        motto3
        spells.font(.footnote)
        spellsGroup.background(.pink)
        spellsBuilder.font(.largeTitle)
        
        CapsuleText(text: "This is new Custome Struct for Text")
        CapsuleText(text: "Second")
       
    }
    
}

struct CapsuleText : View {
    var text : String
    var body: some View {
        Text(text)
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .background(.black)
            .clipShape(.capsule, style: FillStyle())
    }
}

#Preview {
    Views_as_properties()
}
