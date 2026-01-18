//
//  UpdateTodoView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 04/01/26.
//

import SwiftUI
import SwiftData

struct UpdateTodoView: View {
    
    // MARK: - Properties
    @Bindable var item: TodoItem
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                // MARK: - Main Details Section
                Section("Task Details") {
                    TextField("Title", text: $item.title)
                    
                    Toggle("Is Critical?", isOn: $item.isCritical)
                }
                
                // MARK: - Date Section
                Section("Schedule") {
                    DatePicker("Date", selection: $item.timestamp)
                }
            }
            .navigationTitle("Update Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
