//
//  Category 2.swift
//  SwiftUIToDoSwiftData
//
//  Created by Ricardo Ivan Herrera Rocha on 03/02/26.
//


import Foundation
import SwiftData

@Model
final class Category {
    var title: String
    
    @Relationship(deleteRule: .cascade, inverse: \TodoItem.category)
    var items: [TodoItem]?
    
    init(title: String) {
        self.title = title
        self.items = []
    }
}
