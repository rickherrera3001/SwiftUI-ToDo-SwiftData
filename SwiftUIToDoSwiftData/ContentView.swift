//
//  ContentView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 21/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   
    @Query private var items: [TodoItem]
    
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    
                    Text(item.title)
                }
            }
            .navigationTitle("My To-Do List")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
