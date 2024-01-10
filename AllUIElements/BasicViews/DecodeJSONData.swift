//
//  DecodeJSONData.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import SwiftUI

struct DecodeJSONData: View {
    var body: some View {
        Button("Tap me to Decode"){
            let input = """
            {
                "name": "Shyamala",
                "position": "Developer",
                "company": {
                    "name": "CG",
                    "location": "Chennai"
                }
            }
            """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let userdetail = try? decoder.decode(UserDetail.self, from: data){
                print("Decoded Data",userdetail)
                }
            
            }
        }
    }


struct UserDetail : Codable{
    var name : String
    var position : String
    var company : CompanyDetail
}

struct CompanyDetail:Codable{
    var name : String
    var location : String
}

#Preview {
    DecodeJSONData()
}
