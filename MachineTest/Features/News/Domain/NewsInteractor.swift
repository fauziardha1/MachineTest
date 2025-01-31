//
//  NewsInteractor.swift
//  MachineTest
//
//  Created by Fauzi Arda on 31/01/25.
//

import Foundation
class NewsInteractor {
    
    func loadCategories() -> [Category] {
        guard let categoryResponse = getDataFrom(file: "Category", to: CategoryResponse.self) else {
            return []
        }
        return categoryResponse.results
    }
    
    func loadNews() -> [StockNews] {
        guard let newsResponse = getDataFrom(file: "NEWS", to: StockNewsResponse.self) else {
            return []
        }
        return newsResponse.results
    }
    
    
    private func getDataFrom<T:Codable> (file fileName: String, to type: T.Type) -> T? {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("File not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let response = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch {
            print("Error decoding JSON: \(error)")
        }
        return nil
    }
}
