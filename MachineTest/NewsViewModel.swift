//
//  NewsViewModel.swift
//  MachineTest
//
//  Created by Fauzi Arda on 30/01/25.
//

import Foundation
class NewsViewModel {
    var categories = [Category]()
    var stockNews = [StockNews]()
    
    init(){
        self.categories = getCategories()
        self.stockNews = getNews()
    }
    
    private func getCategories() -> [Category] {
        guard let categoryResponse = getDataFrom(file: "Category", to: CategoryResponse.self) else {
            return []
        }
        return categoryResponse.results
    }
    
    private func getNews() -> [StockNews] {
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
