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
    @Query(sort: \TodoItem.timestamp, order: .reverse) private var items: [TodoItem]
    
    // MARK: - Environment
    @Environment(\.modelContext) var context
    
    // MARK: - State
    @State private var showCreate = false
    @State private var searchText = ""
    @State private var toDoToEdit: TodoItem?
    
    // MARK: - Computed Properties
    private var filteredItems: [TodoItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                // MARK: - Row Content
                ForEach(filteredItems) { item in
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
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toDoToEdit = item
                    }
                }
                .onDelete(perform: deleteItems)
                .animation(.snappy, value: filteredItems)
            }
            .navigationTitle("My To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showCreate.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showCreate) {
                CreateTodoView()
                    .presentationDetents([.medium])
            }
            .sheet(item: $toDoToEdit) { item in
                UpdateTodoView(item: item)
                    .presentationDetents([.medium])
            }
            .searchable(text: $searchText, prompt: "Search tasks...")
        }
    }
    
    // MARK: - Private Methods
    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            let itemToDelete = filteredItems[index]
            context.delete(itemToDelete)
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
