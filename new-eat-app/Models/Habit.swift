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
    
    static let habitPresets: [Habit] = [
        Habit(name: "Eat more veggies", totalGoalCount: 3),
        Habit(name: "Eat more fruits", totalGoalCount: 3),
        Habit(name: "Eat more protein", totalGoalCount: 3),
        Habit(name: "Eat more whole foods", totalGoalCount: 4),
        Habit(name: "Eat without distraction", totalGoalCount: 3),
        Habit(name: "Eat meals on time", totalGoalCount: 3),
        Habit(name: "Mindfully savor food", totalGoalCount: 3),
        Habit(name: "Eat without guilt", totalGoalCount: 3),
        Habit(name: "Cook my own food!", totalGoalCount: 1)
    ]
    
    static let whyPresets: [String] = [
        "Edit this later!",
        "To physically feel better",
        "To feel more confident",
        "To build consistency",
        "To improve my relationship with food",
        "To achieve a fitness goal"
    ]
}
