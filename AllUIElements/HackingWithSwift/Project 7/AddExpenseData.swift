//
//  AddExpenseData.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 09/01/24.
//

import SwiftUI

struct AddExpenseData: View {
    @ObservedObject var expenses: ExpenseModel
    @State private var name : String = ""
    @State private var type : ExpenseType = .Business
    @State private var amount : String = "0"
    
    @State private var alertTitle : String = ""
    @State private var alertMessage : String = ""
    @State private var showAlert : Bool = false
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter Expense Name") {
                    TextField("Enter Expense Name", text: $name)
                }
                
                Section("Select Expense Type") {
                    Picker("Select Expnese Type", selection: $type) {
                        ForEach(ExpenseType.allCases,id:\.self){type in
                            Text(type.rawValue)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Enter Expense Amount") {
                    TextField("Enter Expense Amount", text: $amount)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Add New Expense")
            .toolbar(content: {
                Button("Done"){
                    validate(name: name, type: type.rawValue, amount: amount)
                   
                }
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(alertTitle), message: Text(alertMessage),dismissButton: .cancel(Text("Ok")))
            })
        }
    }
    
    
     func validate(name:String,type : String,amount:String){
        guard name != "" else {
            errorMessage(errortitle: "Name", errorMessage: "Enter Valid Expense Name")
            return}
        guard amount != "0" else {
            errorMessage(errortitle: "Amount", errorMessage: "Enter Valid Expense Amount")
            return}
        
        let newExpense = ExpenseData(name: name, type: ExpenseType(rawValue: type) ?? .Personal, amount: Int(amount) ?? 0)
         self.expenses.items.append(newExpense)
         dismiss()
    }
    
    func errorMessage(errortitle : String,errorMessage:String){
        self.alertTitle = errortitle
        self.alertMessage = errorMessage
        self.showAlert = true
    }
}

#Preview {
    AddExpenseData(expenses: ExpenseModel())
}
