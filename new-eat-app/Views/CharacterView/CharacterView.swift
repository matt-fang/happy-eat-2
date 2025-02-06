//
//  Character.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//
import Foundation
import SwiftUI

struct Character: View {
    var named: String
    @State private var isShown: Bool = true
    var viewModel: UserViewModel
    
    var body: some View {
        Image(named)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(-5)
            .opacity(isShown ? 1 : 0)
            .scaleEffect(isShown ? 1 : 0.5) // Shrinks while fading
            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isShown)
            .onTapGesture {
                if isShown {
                    viewModel.incrementGoalCount()
                    isShown = false
                }
            }
    }
}
