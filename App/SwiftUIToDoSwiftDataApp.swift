//
//  SwiftUIToDoSwiftDataApp.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 21/12/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftUIToDoSwiftDataApp: App {
    
    // MARK: - Scene
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        // MARK: - Model Container Configuration
        .modelContainer(for: TodoItem.self)
    }
}
