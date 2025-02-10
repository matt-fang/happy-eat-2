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
    private(set) var user = User(currentHabit: Presets.habits[0])
    
    func setHabit(habit: Int) {
        user.currentHabit = Presets.habits[habit]
    }

    func setTotalGoalCount(totalGoalCount: Int) {
        user.currentHabit.totalGoalCount = totalGoalCount
    }

    func setHabitWhy(why: Int) {
        user.currentHabit.why = Presets.whys[why]
    }
    
    func incrementGoalCount() {
        user.currentHabit.completedGoalCount += 1
    }
    
    func incrementDayCount() {
        user.currentHabit.completedDays += 1
    }
    
    func resetGoalCount() {
        user.currentHabit.completedGoalCount = 0
    }
}
