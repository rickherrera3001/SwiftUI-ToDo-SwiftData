//
//  ContentView.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 21/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // Trae los datos automáticamente y mantiene la UI sincronizada
    @Query private var items: [TodoItem]
    
    // El contexto nos permite interactuar con la base de datos
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    // Por ahora solo mostramos el título
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
