import SwiftUI
import SwiftData

@main
struct SwiftUIToDoSwiftDataApp: App {
    
    // MARK: - Body Scene
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // MARK: - Model Container Setup
        .modelContainer(for: [TodoItem.self, Category.self])
    }
}
EOFv

