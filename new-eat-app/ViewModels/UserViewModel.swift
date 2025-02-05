//
//  UserViewModel.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//

import Foundation
import Observation

@Observable class UserViewModel {
    // MARK: ideally currentHabit is an optional — but that makes things complicated in FoodView so figure that out
    var user = User(currentHabit: Presets.habits[0])
    
    func setHabit(habit: Int, totalGoalCount: Int, why: Int) {
        user.currentHabit = Habit(name: Presets.habits[habit].name, totalGoalCount: totalGoalCount, why: Presets.whys[why])
    }
}
