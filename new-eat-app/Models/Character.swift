//
//  Character.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//
import Foundation
import SwiftUI

struct Character: Hashable, Identifiable {
    var id: UUID = UUID()
    var named: String
    var isShown: Bool
}
