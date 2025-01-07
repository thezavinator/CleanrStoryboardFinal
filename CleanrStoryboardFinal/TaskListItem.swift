//
//  TaskListItem.swift
//  CleanrStoryboardFinal
//
//  Created by Zavier Hofstetter on 1/7/25.
//

import Foundation

struct TaskListItem: Codable, Identifiable {
    let id: String
    let taskText: String
    var isDone: Bool
    var isGroupable: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
