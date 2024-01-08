//
//  MyWorkScramble.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 08/01/24.
//

import SwiftUI

struct MyWorkScramble: View {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(.red)]
    }
    
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var userWords = [String]()
    @State private var score : Int = 0
    
    @State private var alertTitle : String = ""
    @State private var alertMessage : String = ""
    @State private var isShowAlert : Bool = false
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Button(action: startGame, label: {
                Text("Restart")
            }).padding(30)
            
            NavigationView(content: {
                VStack{
                    
                    TextField("Enter your answer", text: $newWord,onCommit: addNewWrod)
                        .autocapitalization(.none)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Form{
                       Section(header:  HStack{
                           Text("Used Words")
                           Spacer()
                           Text("Your Score : \(score)")
                       }.font(.headline)
                        .padding()
                       ) {
                           ForEach(userWords,id:\.self){word in
                               Text(word)
                           }
                       }
                    }
                    Spacer()
                }
                .navigationTitle(rootWord)
                .onAppear(perform: {
                    startGame()
                })
                .alert(isPresented: $isShowAlert, content: {
                    Alert(title: Text(alertTitle),message: Text(alertMessage),dismissButton: .default(Text("OK")))
                })
            })
            
        })
    }
   
    func startGame(){
        self.score = 0
        self.userWords.removeAll()
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWord = try? String(contentsOf: startWordURL){
                let allwords = startWord.components(separatedBy: "\n")
                rootWord = allwords.randomElement() ?? "unknown"
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }
    
    func addNewWrod(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespaces)
        guard answer.count > 0 else {return}
        
      
        guard isOriginal(word: answer) else {
            errorMessage(title: "Word used already", message: "Be more original")
                   return
               }
        guard isPossible(word: answer) else {
            errorMessage(title: "Word not recognized", message: "You can't just make them up, you know!")
                  return
              }
              
              guard isRealWord(word: answer) else {
                  errorMessage(title: "Word not possible", message: "That isn't a real word")
                  return
              }
              guard isSame(word: answer) else {
                  errorMessage(title: "Same word as root word.", message: "Be much more original.")
                  return
              }
              guard isReal(word: answer) else {
                  errorMessage(title: "Too short", message: "You have to enter words longer than 3 letters.")
                  return
              }
        
        self.userWords.insert(answer, at: 0)
        self.score += answer.count
        newWord = ""
    }
    
    func isOriginal(word : String) -> Bool{
        !userWords.contains(word)
    }
    func isPossible(word : String) -> Bool{
        var tempWord = word.lowercased()
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else{
                return false
            }
            
        }
        return true
    }
    func isSame(word : String) -> Bool{
        return word.lowercased() != rootWord
    }
    func isReal(word : String) -> Bool{
        return word.count >= 3
    }
    
    func isRealWord(word : String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelled = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return mispelled.location == NSNotFound
        
    }
    
    func errorMessage(title : String,message : String){
        self.alertTitle = title
        self.alertMessage = message
        self.isShowAlert = true
    }
    
}

#Preview {
    MyWorkScramble()
}
