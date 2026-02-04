//
//  TodoItem.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 28/12/25.
//

import Foundation
import SwiftData

// MARK: - Model Definition
@Model
class TodoItem {
    
    // MARK: - Properties
    var title: String
    var timestamp: Date
    var isCritical: Bool
    var category: Category?
    var isCompleted: Bool
    
    // MARK: - Initialization
    init(title: String = "",
         timestamp: Date = .now,
         isCritical: Bool = false,
         isCompleted: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }
}
