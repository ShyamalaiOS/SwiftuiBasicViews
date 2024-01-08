//
//  StringData.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 08/01/24.
//

import SwiftUI

struct StringData: View {
    let input = "sa b c "
    let inputmultiline = """
        
aa
bb
cc
"""
    let word = "swift"
    let checker = UITextChecker()
    var body: some View {
        
        let letter = self.input.components(separatedBy: " ")
        Text( "\(letter[0])")
        
        let letters = self.inputmultiline.components(separatedBy: "\n")
        let letterss = letters.randomElement()
        Button("Press here"){
            print("letterssletterss \(letterss ?? "") \(letterss ?? "")")
        }
        let trimmdata = input.trimmingCharacters(in: .whitespaces)
        Text( "\(trimmdata)")
        let range = NSRange(location: 0, length: word.utf16.count)

        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
//        Text( "\(allGood)")

    }
}

#Preview {
    StringData()
}
