//
//  iExpense.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 09/01/24.
//

import SwiftUI

enum ExpenseType : String,CaseIterable,Codable{
    case Business
    case Personal
}

protocol Encodable: Identifiable, Codable {
    var id: UUID { get }
}

struct ExpenseData : Encodable{
    var id = UUID()
    var name : String
    var type : ExpenseType
    var amount : Int
}

class ExpenseModel : ObservableObject{
    @Published var items = [ExpenseData](){
        didSet{
            let encoder = JSONEncoder()
            if let encode = try? encoder.encode(items){
                UserDefaults.standard.set(encode, forKey: "Items")
            }
        }
    }
    init(){
        let decode = JSONDecoder()
        if let itemsdata  = UserDefaults.standard.data(forKey: "Items"){
            if let decodeItem = try? decode.decode([ExpenseData].self, from: itemsdata){
                self.items = decodeItem
            }
        }
    }
}

struct iExpense: View {
    @ObservedObject var expense = ExpenseModel()
    @State private var showAddExpenseSheet = false
    var body: some View {
        VStack{
            NavigationStack{
                VStack{
                    List{
                        ForEach(expense.items)
                        { expense in
                            HStack{
                                VStack(alignment: .leading, content: {
                                    Text(expense.name)
                                    Text(expense.type.rawValue)
                                })
                                Spacer()
                                Text(expense.amount,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                            }
                        }.onDelete(perform: { indexSet in
                            self.expense.items.remove(atOffsets: indexSet)
                        })
                    }
                }
                .navigationTitle("Expense List")
                .toolbar(content: {
                    Button("Add Expense",systemImage : "plus"){
                        showAddExpenseSheet.toggle()
                    }
                })
                .sheet(isPresented: $showAddExpenseSheet, content: {
                    AddExpenseData(expenses: self.expense)
                })
            }
        }
    }
}

#Preview {
    iExpense()
}
