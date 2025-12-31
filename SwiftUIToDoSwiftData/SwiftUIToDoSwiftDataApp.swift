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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
