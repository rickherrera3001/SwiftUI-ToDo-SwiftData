//
//  UpdateTodoView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 04/01/26.
//

import SwiftUI
import SwiftData

struct UpdateTodoView: View {
    
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    @Bindable var item: TodoItem
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                // MARK: - Input Section
                TextField("Todo Title", text: $item.title)
                DatePicker("Date", selection: $item.timestamp)
                Toggle("Critical?", isOn: $item.isCritical)
                
                // MARK: - Actions Section
                Button("Done") {
                    dismiss()
                }
            }
            .navigationTitle("Update Todo")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    UpdateTodoView(item: TodoItem(title: "Sample Task"))
        .modelContainer(for: TodoItem.self, inMemory: true)
}
