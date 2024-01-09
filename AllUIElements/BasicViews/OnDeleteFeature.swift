//
//  OnDeleteFeature.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 09/01/24.
//

import SwiftUI

struct OnDeleteFeature: View {
    @State private var number = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        VStack{
            NavigationStack{
                List{
                    ForEach(number,id:\.self){
                        Text("Row \($0.description)")
                    }.onDelete(perform: { indexSet in
                        removeRow(at: indexSet)
                    })
                }
                Button("Tap to Add New row"){
                    number.append(currentNumber)
                    currentNumber += 1
                }
                
                .toolbar {
                    EditButton()
                }
            }
        }
       
    }
    
    func removeRow(at index : IndexSet){
        number.remove(atOffsets: index)
    }
}

#Preview {
    OnDeleteFeature()
}
