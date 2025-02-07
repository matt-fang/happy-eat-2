//
//  UserViewModel.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//

import Foundation
import Observation
import SwiftUI

@Observable class UserViewModel {
    // MARK: ideally currentHabit is an optional — but that makes things complicated in FoodView so figure that out
    
    var user = User(currentHabit: Presets.habits[0], currentCharacters: [Character(named: "orangeguy", isShown: true), Character(named: "orangeguy", isShown: true), Character(named: "orangeguy", isShown: true)])
    
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
        if user.currentHabit.totalGoalCount == user.currentHabit.completedGoalCount {
            user.currentHabit.completedDays += 1
        }
    }
    
    func resetGoalCount() {
        user.currentHabit.completedGoalCount = 0
    }
    
//    func checkToIncrementGoalCount() {
//        if user.currentHabit.completedGoalCount == user.currentHabit.totalGoalCount {
//            lastDate = Date().timeIntervalSince1970
//            incrementDayCount()
//        }
        
    func characterFactory(count: Int, viewModel: UserViewModel) {
        var characterList: [Character] = []
        for _ in 0..<count {
            characterList.append(Character(named: "orangeguy", isShown: true))
        }
        user.currentCharacters = characterList
    }
    
    func resetCharacters() {
        user.currentCharacters = user.currentCharacters.map { character in
            var updatedCharacter = character
            updatedCharacter.isShown = true
            print(updatedCharacter)
            return updatedCharacter
        }
    }
    }

