//
//  Astronuts.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import Foundation

struct Astronauts : Codable{
    var list : [AstronautDetail]
}

struct AstronautDetail : Codable,Identifiable{
    var id : String
    var name : String
    var description : String
}
