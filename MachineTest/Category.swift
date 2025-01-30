//
//  Category.swift
//  MachineTest
//
//  Created by Fauzi Arda on 30/01/25.
//

import Foundation
struct CategoryResponse: Codable {
    let results: [Category]
}

// MARK: - Result
struct Category: Codable {
    let id: Int
    let isActive: Bool
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case isActive = "is_active"
        case name
    }
}
