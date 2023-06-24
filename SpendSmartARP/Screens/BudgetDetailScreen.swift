//
//  BudgetDetailScreen.swift
//  SpendSmartARP
//
//  Created by Mohammad Azam on 6/18/23.
//

import SwiftUI
import SwiftData

struct BudgetDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    
    let budget: Budget
    
    @State private var note: String = ""
    @State private var amount: Double?
    @State private var date: Date = Date()
    @State private var hasReceipt: Bool = false
  
    @Query private var transactions: [Transaction]
    
    
    init(budget: Budget) {
        self.budget = budget
        // Missing argument label 'lhs:' in call
        // Initializer 'init(_:)' requires that 'Budget' conform to 'Decodable'
        // Initializer 'init(_:)' requires that 'Budget' conform to 'Encodable'
        _transactions = Query(filter: #Predicate { $0.budget!.name.contains(budget.name) })
    } 
    
    private func saveTransaction() {
        let transaction = Transaction(note: note, amount: amount!, date: date, hasReceipt: hasReceipt)
        budget.addTransaction(transaction)
    }
    
    private func deleteTransaction(_ transaction: Transaction) {
        
        if let index = budget.transactions.firstIndex(where: { $0.id == transaction.id }) {
            budget.transactions.remove(at: index)
        }
        
        context.delete(transaction)
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        Form {
            TextField("Note", text: $note)
            TextField("Amount", value: $amount, format: .number)
                .keyboardType(.numberPad)
            DatePicker("Date", selection: $date)
            Toggle("Receipt", isOn: $hasReceipt)
            Button("Save Transaction") {
               saveTransaction()
            }
            
            Section("Transactions") {
                HStack {
                    Spacer()
                    Text(budget.transactionsTotal!, format: .currency(code: "USD"))
                    Spacer()
                }
                .padding(5)
                .background(.green)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18.0, style: .continuous))
                
                TransactionListView(transactions: budget.transactions, onDelete: deleteTransaction)
            }
            
        }.navigationTitle(budget.name)
    }
}
 
struct BudgetDetailContainerView: View {
    
    @Query private var budgets: [Budget]
    
    var body: some View {
        NavigationStack {
            BudgetDetailScreen(budget: budgets[0])
        }
    }
}

#Preview { @MainActor in
    return BudgetDetailContainerView()
        .modelContainer(previewContainer)
}

/*
@MainActor
struct BudgetDetailContainer_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailContainerView()
            .modelContainer(previewContainer)
    }
}
 */

