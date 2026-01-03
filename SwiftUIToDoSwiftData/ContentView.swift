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
    
    /// Environment context to manage data operations (Create, Update, Delete)
    @Environment(\.modelContext) var context
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    
                    // MARK: - Row Content
                    Text(item.title)
                }
            }
            .navigationTitle("My To-Do List")
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
