//
//  OnboardingView.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//

import SwiftUI

struct OnboardingView: View {
    @Bindable var viewModel: UserViewModel
    @Binding var isOnboarding: Bool
    @State private var onboardingStep = 1
    
    // MARK: CAN YOU NOT HAVE TO INIT HERE LOL?? it only causes problems
    @State private var habitIndex: Int = 0
    @State private var totalGoalCount: Int = 0
    @State private var whyIndex: Int = 0
    
    var body: some View {
        VStack {
            if onboardingStep == 1 {
                Text("welcome!")
                Button("Next") { onboardingStep += 1 }
            } else if onboardingStep == 2 {
                Text("this app helps you build habits")
                Button("Next") { onboardingStep += 1 }
            } else if onboardingStep == 3 {
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
                Button("Next") { onboardingStep += 1 }
            } else if onboardingStep == 4 {
                Text("How many times per day?")
                
                // MARK: fix the stepper jump — consequence of needing to arbitrarily init everything at the top of this view (not ideal)
                Stepper("\(totalGoalCount)", value: $totalGoalCount, in: 1...10)
                Button("Next") { onboardingStep += 1 }
            } else if onboardingStep == 5 {
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
                Button("Next") { onboardingStep += 1 }
            } else if onboardingStep == 6 {
                Text("tap the fruits if you eat them")
                Button("Next") { onboardingStep += 1 }
            } else if onboardingStep == 7 {
                Text("write down helpful stuff and find inspo in your toolbox!")
                Button("Finish") {
                    viewModel.setHabit(habit: habitIndex, totalGoalCount: totalGoalCount, why: whyIndex)
                    print (viewModel.user.currentHabit.name, viewModel.user.currentHabit.totalGoalCount, viewModel.user.currentHabit.why)
                    isOnboarding = false
                }
            }
        }
    }
}
