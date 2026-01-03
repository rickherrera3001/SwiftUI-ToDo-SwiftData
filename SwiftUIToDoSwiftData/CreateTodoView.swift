//
//  CreateTodoView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 30/12/25.
//

import SwiftUI
import SwiftData

struct CreateTodoView: View {
    
    // MARK: - Environment
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    // MARK: - State Properties
    @State private var title: String = ""
    @State private var timestamp: Date = .now
    @State private var isCritical: Bool = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                
                // MARK: - Input Section
                TextField("Todo Title", text: $title)
                DatePicker("Date", selection: $timestamp)
                Toggle("Critical?", isOn: $isCritical)
                // MARK: - Actions Section
                Button("Create") {
                    addTask()
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("Add Todo")
            .toolbar {
                // MARK: - Navigation Buttons
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
    
    // MARK: - Private Methods
    private func addTask() {
        let newTask = TodoItem(title: title,
                               timestamp: timestamp,
                               isCritical: isCritical)
        context.insert(newTask) 
        dismiss()
    }
}

// MARK: - Preview
#Preview {
    CreateTodoView()
        .modelContainer(for: TodoItem.self)
}
