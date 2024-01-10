//
//  GridView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import SwiftUI

struct GridView: View {
    var body: some View {
       let layout = [
            GridItem(.adaptive(minimum: 80, maximum: 100)),
            GridItem(.adaptive(minimum: 80, maximum: 100)),
            GridItem(.adaptive(minimum: 80, maximum: 100))
       ]
        ScrollView(){
            LazyVGrid(columns: layout){
                ForEach(1..<1001){
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    GridView()
}
