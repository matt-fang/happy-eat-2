//
//  Model.swift
//  new-eat-app
//
//  Created by Matthew Fang on 2/4/25.
//

import Foundation

struct Entry: Identifiable, Codable {
    var id: UUID = UUID()
    var type: String
    var title: String
    var body: String
}
