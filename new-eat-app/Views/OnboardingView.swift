//
//  OnboardingView.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//

import SwiftUI

struct OnboardingView: View {
    @Bindable var viewModel: UserViewModel
    @State private var onboardingStep = 1
    @AppStorage("finishedOnboarding") private var finishedOnboarding: Bool = false
    
    // MARK: do these state variables need to exist at all? they cause some optional problems later down
    @State private var habitIndex: Int?
    @State private var totalGoalCount: Int?
    @State private var whyIndex: Int?
    
    var body: some View {
        VStack {
            if onboardingStep == 1 {
                Text("welcome!")
                nextButton
            } else if onboardingStep == 2 {
                Text("this app helps you build habits")
                nextButton
            } else if onboardingStep == 3 {
                pickHabit
            } else if onboardingStep == 4 {
                pickFrequency
            } else if onboardingStep == 5 {
                pickWhy
            } else if onboardingStep == 6 {
                Text("tap the fruits if you eat them")
                nextButton
            } else if onboardingStep == 7 {
                Text("write down helpful stuff and find inspo in your toolbox!")
                Button("Finish") {
                    finishedOnboarding = true
                    print(finishedOnboarding)
                print ("\(viewModel.user.currentHabit.name), \(viewModel.user.currentHabit.totalGoalCount), \(viewModel.user.currentHabit.why ?? "No reason")")
                }
            }
        }
    }
    
    var nextButton: some View {
        Button("Next") { onboardingStep += 1 }
    }
    
    var pickHabit: some View {
        VStack {
            Text("pick a habit!")
            ScrollView {
                ForEach(0..<Presets.habits.count, id: \.self) { index in
                    Button {
                        habitIndex = index
                    } label: {
                        Text(Presets.habits[index].name)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(habitIndex == index ? Color.blue : Color.gray)
                            .cornerRadius(10)
                    }
                }
            }
            nextButton
        }.onDisappear {
            // MARK: prevent the screen from disappearing if habit doesn't exist!! don't just default to 3 lmao
            // MARK: IS FORCE UNWRAPPPING OK HERE?
            viewModel.setHabit(habit: habitIndex!)
            totalGoalCount = viewModel.user.currentHabit.totalGoalCount
        }
    }
    
    var pickFrequency: some View {
        VStack {
            Text("How many times per day?")
            
            // MARK: what is happening here lol — understand
            Stepper("\(totalGoalCount ?? 3)", value: Binding(
                get: { totalGoalCount ?? 1 },
                set: { totalGoalCount = $0 }
            ), in: 1...5)
            nextButton
        }.onDisappear {
            viewModel.setTotalGoalCount(totalGoalCount: totalGoalCount!)
        }
    }
    
    var pickWhy: some View {
        VStack {
            Text("why do you want to do this habit?")
            ScrollView {
                ForEach(0..<Presets.whys.count, id: \.self) { index in
                    Button {
                        whyIndex = index
                    } label: {
                        Text(Presets.whys[index])
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(whyIndex == index ? Color.blue : Color.gray)
                            .cornerRadius(10)
                    }
                }
            }
            nextButton
        }.onDisappear {
            // MARK: is this optional handling ideal?
            viewModel.setHabitWhy(why: whyIndex ?? 0)
        }
    }
}
