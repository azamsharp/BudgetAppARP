//
//  Transaction.swift
//  SpendSmartARP
//
//  Created by Mohammad Azam on 6/18/23.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    var note: String
    var amount: Double
    var date: Date
    var hasReceipt: Bool = false
    
    @Relationship(inverse: \Budget.transactions)
    var budget: Budget?
    
    init(note: String, amount: Double, date: Date, hasReceipt: Bool = false) {
        self.note = note
        self.amount = amount
        self.date = date
        self.hasReceipt = hasReceipt
    }
    
}
