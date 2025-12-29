//
//  TodoItem.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 28/12/25.
//

import Foundation
import SwiftData

@Model // 1. Esta macro convierte una clase simple en un modelo de base de datos persistente
class TodoItem {
    var title: String
    var timestamp: Date
    var isCritical: Bool
    var isCompleted: Bool
    
    // 2. En SwiftData, los modelos deben ser clases y necesitan un inicializador
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
