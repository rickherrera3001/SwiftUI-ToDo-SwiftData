//
//  CreateTodoView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 30/12/25.
//

import SwiftUI
import SwiftData

struct CreateTodoView: View {
    
    // MARK: - Environment Properties
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Persistent Data Properties
    @Query(sort: \Category.title) private var categories: [Category]
    
    // MARK: - View State Properties
    @State private var title: String = ""
    @State private var timestamp: Date = .now
    @State private var isCritical: Bool = false
    @State private var selectedCategory: Category?
    
    // MARK: - UI Component Body
    var body: some View {
        NavigationStack {
            Form {
                // MARK: - Basic Info Section
                Section("Tarea") {
                    TextField("Todo Title", text: $title)
                    DatePicker("Date", selection: $timestamp)
                    Toggle("Critical?", isOn: $isCritical)
                }
                
                // MARK: - Relationship Selection Section
                Section("Categoría") {
                    Picker("Selecciona Categoría", selection: $selectedCategory) {
                        Text("Ninguna").tag(nil as Category?)
                        
                        ForEach(categories) { category in
                            Text(category.title).tag(category as Category?)
                        }
                    }
                }
                
                // MARK: - Action Controls Section
                Section {
                    Button("Create") {
                        addTask()
                    }
                    .disabled(title.isEmpty)
                }
            }
            .navigationTitle("Add Todo")
            .toolbar {
                // MARK: - Navigation Bar Items
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
    
    // MARK: - Private Logic Methods
    private func addTask() {
        let newTask = TodoItem(title: title,
                               timestamp: timestamp,
                               isCritical: isCritical)
        
        // Vinculando la relación con el modelo seleccionado
        newTask.category = selectedCategory
        
        context.insert(newTask)
        dismiss()
    }
}

// MARK: - View Preview Provider
#Preview {
    CreateTodoView()
        .modelContainer(for: [TodoItem.self, Category.self])
}
