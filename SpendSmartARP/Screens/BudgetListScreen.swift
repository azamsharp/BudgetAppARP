//
//  ContentView.swift
//  SpendSmartARP
//
//  Created by Mohammad Azam on 6/18/23.
//

import SwiftUI
import SwiftData

struct BudgetListScreen: View {
    
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate { $0.limit > 100 && $0.name.contains("Vac") }) private var budgets: [Budget]
    
    
    //@Query private var budgets: [Budget]
    
    @State private var name: String = ""
    @State private var limit: Double?
    
    func saveBudget() {
        let budget = Budget(name: name, limit: limit!)
        context.insert(budget)
    }
    
    var body: some View {
        Form {
            Section("New Budget") {
                TextField("Name", text: $name)
                TextField("Limit", value: $limit, format: .number)
                    .keyboardType(.numberPad)
                Button("Save") {
                    saveBudget()
                }.buttonStyle(.borderless)
            }
            
            Section("Budgets") {
                List(budgets) { budget in
                    NavigationLink(value: budget) {
                        HStack {
                            Text(budget.name)
                            Spacer()
                            Text(budget.limit, format: .currency(code: "USD"))
                        }
                    }
                }
            }
        }
        .navigationTitle("Budgets")
        .navigationDestination(for: Budget.self) { budget in
            BudgetDetailScreen(budget: budget)
        }
    }
}

@MainActor
struct BudgetListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BudgetListScreen()
            .modelContainer(previewContainer)
    }
}
