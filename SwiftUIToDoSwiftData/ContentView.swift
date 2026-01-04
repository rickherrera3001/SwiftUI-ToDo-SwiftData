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
                }
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
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
