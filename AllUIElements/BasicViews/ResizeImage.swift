//
//  ResizeImage.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

/* 
 Clipped
 resizable()
 scaledToFit() and scaledToFill()
 containerRelativeFrame()
*/

import SwiftUI

struct ResizeImage: View {
    var body: some View {
       Image("France")
            .resizable()
//            .scaledToFit() // give Empty part
//            .scaledToFill()
            .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.5
                
                }
//            .frame(width: 300,height: 300)
//            .clipped()
    }
}

#Preview {
    ResizeImage()
}
