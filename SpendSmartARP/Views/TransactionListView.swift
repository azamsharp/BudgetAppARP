//
//  TransactionListView.swift
//  SpendSmartARP
//
//  Created by Mohammad Azam on 6/18/23.
//

import SwiftUI
import SwiftData

struct TransactionListView: View {
    
    let transactions: [Transaction]
    let onDelete: (Transaction) -> Void
    
    var body: some View {
        List {
            ForEach(transactions) { transaction in
                HStack {
                    Text(transaction.note)
                    Spacer()
                    Text(transaction.amount, format: .currency(code: "USD"))
                }
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let transaction = transactions[index]
                    onDelete(transaction)
                }
            })
        }
    }
}

struct TransactionListContainerView: View {
    
    @Query private var budgets: [Budget]
    
    var body: some View {
        TransactionListView(transactions: budgets[0].transactions, onDelete: { _ in })
    }
}

@MainActor
struct TransactionListView_Previews: PreviewProvider {
    
    static var previews: some View {
       TransactionListContainerView()
            .modelContainer(previewContainer)
    }
}
