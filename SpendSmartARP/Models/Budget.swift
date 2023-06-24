//
//  Budget.swift
//  SpendSmartARP
//
//  Created by Mohammad Azam on 6/18/23.
//

import Foundation
import SwiftData

@Model
final class Budget {
    
    var name: String
    var limit: Double
    
    @Relationship(.cascade)
    var transactions: [Transaction] = []
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
    
    @Transient
    var transactionsTotal: Double? {
        return transactions.reduce(0) { $0 + $1.amount }
    }
    
    func addTransaction(_ transaction: Transaction) {
        // add business domain rules here
        self.transactions.append(transaction)
    }
}

extension Budget {
    
    static var preview: Budget {
        Budget(name: "", limit: 100)
    }
    
}
