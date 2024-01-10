//
//  MissionModel.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import Foundation

struct Mission: Codable,Identifiable{
    var id : Int
    var crew : [Crew]
    var launchDate : String?
    var description : String
    
    var displayName : String{
        return "Applo \(id)"
    }
    
    var image : String{
        return "apollo\(id)"
    }
    
    var formatedLaunchedData : String{
        if let launchdate = launchDate{
//            let formatter = DateFormatter()
//            formatter.dateStyle = .long
//            return formatter.string(from: launchdate)
            return launchdate
        }
        else{
            return "N/A"
        }
    }
}
struct Crew: Codable{
    var name : String
    var role : String
}
