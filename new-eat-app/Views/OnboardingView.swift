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
                welcome
            } else if onboardingStep == 2 {
                about
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
        Button{
            onboardingStep += 1
        } label: {
            Text("Next")
                .font(.button)
                .foregroundColor(.white)
                .frame(maxWidth: 180)
                .padding(.vertical, 16)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 32))
        }
    }
    
    var welcome: some View {
        VStack {
            Spacer()
            Text("Hey there! \n \n Welcome to Happy Eat.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            nextButton
                .padding(.bottom, 40)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.yellow
                    .ignoresSafeArea()
            }
    }
    
    var about: some View {
        VStack {
            Spacer()
            Text("This is a different kind of nutrition app, \n \n one that values sustainability over quick fixes, \n \n and how you feel over what you eat.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
            nextButton
                .padding(.bottom, 40)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.yellow
                    .ignoresSafeArea()
            }
    }
    
    var pickHabit: some View {
        
        VStack(alignment: .center, spacing: 24) {
            VStack(alignment: .center, spacing: 16) {
                Text("We're all about building\nhabits here, since habits\nare what stick with you!")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                Text("Choose one habit you want to form:")
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            VStack(alignment: .center, spacing: 12) {
                ScrollView {
                    ForEach(0..<Presets.habits.count, id: \.self) { index in
                        Button {
                            habitIndex = index
                        } label: {
                            CardView(content: Presets.habits[index].name, isSelected: habitIndex == index)
                        }
                    }
                }
            }.padding()
            Spacer()
            
            nextButton.padding(.bottom, 30)
            
            
        }.onDisappear {
            // MARK: prevent the screen from disappearing if habit doesn't exist!! don't just default to 3 lmao
            // MARK: IS FORCE UNWRAPPPING OK HERE?
            viewModel.setHabit(habit: habitIndex!)
            totalGoalCount = viewModel.user.currentHabit.totalGoalCount
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.yellow
                    .ignoresSafeArea()
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
            viewModel.characterFactory(count: totalGoalCount!, viewModel: viewModel)
            print(viewModel.user.currentCharacters)
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
