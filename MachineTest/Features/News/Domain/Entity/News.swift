//
//  News.swift
//  MachineTest
//
//  Created by Fauzi Arda on 30/01/25.
//

import Foundation
// MARK: - Main Response Model
struct StockNewsResponse: Codable {
    let results: [StockNews]
}

// MARK: - Stock News Item
struct StockNews: Codable {
    let source: String
    let pubDate: String
    let id: Int
    let prices: [StockPrice]
    let title: String
    let link: String
    let type: String

    // Custom Coding Keys if needed
    enum CodingKeys: String, CodingKey {
        case source, id, prices, title, link, type
        case pubDate = "pub_date"
    }
}

// MARK: - Stock Price Model
struct StockPrice: Codable {
    let code: String
    let changePct: Double
    let price: Int

    enum CodingKeys: String, CodingKey {
        case code, price
        case changePct = "change_pct"
    }
}
