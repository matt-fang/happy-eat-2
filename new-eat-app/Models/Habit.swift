//
//  Goal.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    let name: String
    
    var totalGoalCount: Int
    var completedGoalCount: Int = 0
    
    var totalDays: Int = 21
    var completedDays: Int = 0
    
    var why: String?
    
    var pinnedEntry: Entry?
    
}
