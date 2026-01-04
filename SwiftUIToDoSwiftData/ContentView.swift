//
//  ContentView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 21/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - Properties
    /// SwiftData Query to fetch items automatically
    @Query private var items: [TodoItem]
    
    // MARK: - Environment
    /// Environment context to manage data operations
    @Environment(\.modelContext) var context
    
    // MARK: - State
    /// Controls the visibility of the creation sheet
    @State private var showCreate = false
    /// Stores the item currently being edited
    @State private var toDoToEdit: TodoItem?
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                // MARK: - Row Content
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            
                            Text(item.timestamp, format: .dateTime.day().month().year())
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        if item.isCritical {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundStyle(.red)
                        }
                    }
                    // MARK: - Interaction Section
                    .contentShape(Rectangle())  
                    .onTapGesture {
                        toDoToEdit = item
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("My To-Do List")
            
            // MARK: - Navigation Buttons
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showCreate.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            // MARK: - Sheets
            .sheet(isPresented: $showCreate) {
                CreateTodoView()
                    .presentationDetents([.medium])
            }
            .sheet(item: $toDoToEdit) { item in
                UpdateTodoView(item: item)
                    .presentationDetents([.medium])
            }
        }
    }
    
    // MARK: - Private Methods
    /// Deletes selected items from the SwiftData context
    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            let itemToDelete = items[index]
            context.delete(itemToDelete)
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
