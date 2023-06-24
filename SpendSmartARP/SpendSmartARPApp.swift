//
//  SpendSmartARPApp.swift
//  SpendSmartARP
//
//  Created by Mohammad Azam on 6/18/23.
//

import SwiftUI
import SwiftData

@main
struct SpendSmartARPApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                BudgetListScreen()
            }
        }
        .modelContainer(for: Budget.self, isAutosaveEnabled: false)
        
    }
}
