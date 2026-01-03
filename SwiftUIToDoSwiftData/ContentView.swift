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
    @Query private var items: [TodoItem]
    
    // MARK: - Environment
    @Environment(\.modelContext) var context
    
    // MARK: - State
    @State private var showCreate = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                // MARK: - Row Content
                ForEach(items) { item in
                    Text(item.title)
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
