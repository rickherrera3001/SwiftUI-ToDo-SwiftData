//
//  Item.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 21/12/25.
//

import Foundation
import SwiftData

// MARK: - Model Definition
@Model
final class Item {
    // MARK: - Properties
    var timestamp: Date
    
    // MARK: - Initialization
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
