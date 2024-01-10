//
//  Bundle.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import Foundation

extension Bundle{
    func decode<T : Codable>(_ filename : String) -> T{
        guard let fileUrl = self.url(forResource: filename, withExtension: nil) else{
            fatalError("File couldnt find")
        }
        
        guard let data = try? Data(contentsOf: fileUrl) else{
            fatalError("Data couldnt convert")
        }
        let decoder = JSONDecoder()
        guard let astronauts = try? decoder.decode(T.self, from: data) else{
            fatalError("Decoding Error")
        }
        return astronauts
    }
}
