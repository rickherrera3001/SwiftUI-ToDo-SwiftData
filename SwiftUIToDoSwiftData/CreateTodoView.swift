//
//  CreateTodoView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 30/12/25.
//

import SwiftUI
import SwiftData

struct CreateTodoView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var timestamp: Date = .now
    @State private var isCritical: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Todo Title", text: $title)
                DatePicker("Date", selection: $timestamp)
                Toggle("Critical?", isOn: $isCritical)
                
                Button("Create") {
                    addTask()
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("Add Todo")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
    
    private func addTask() {
        let newTask = TodoItem(title: title,
                               timestamp: timestamp,
                               isCritical: isCritical)
        context.insert(newTask) 
        dismiss()
    }
}

#Preview {
    CreateTodoView()
        .modelContainer(for: TodoItem.self)
}
