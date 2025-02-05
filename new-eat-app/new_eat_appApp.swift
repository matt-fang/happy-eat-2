//
//  new_eat_appApp.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//

import SwiftUI

@main
struct new_eat_appApp: App {
    @State var viewModel = UserViewModel()
    @State private var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView(viewModel: viewModel, isOnboarding: $isOnboarding)
            } else {
                FoodView(viewModel: viewModel)
            }
        }
    }
}
