//
//  CreateCategoryView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 06/02/26.
//

import SwiftUI
import SwiftData

struct CreateCategoryView: View {
    
    // MARK: - Properties
    @Environment(\.modelContext) private var contex
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                // MARK: - Input Section
                Section("Información") {
                    TextField("Nombre de la categoria", text: $title)
                }
            }
            .navigationTitle("Nueva categoria")
            .navigationBarTitleDisplayMode(.inline)
            // MARK: - Toolbar
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        save()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
    
    // MARK: - Logic
    private func save() {
        let newCategory = Category(title: title)
        contex.insert(newCategory)
        dismiss()
    }
}

