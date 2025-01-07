//
//  TaskList.swift
//  CleanrStoryboardFinal
//
//  Created by Zavier Hofstetter on 1/6/25.
//

import SwiftUI

class TaskList: ObservableObject {
    @Published var tasks = [String]()
}

struct Task {
    let taskName = "DefaultName"
}

extension Task: Equatable {}

