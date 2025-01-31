//
//  NewsViewModel.swift
//  MachineTest
//
//  Created by Fauzi Arda on 30/01/25.
//

import Foundation
class NewsViewModel {
    private var categories = [Category]()
    private var stockNews = [StockNews]()
    private let interactor: NewsInteractor
    
    init(){
        self.interactor = NewsInteractor()
        self.categories = interactor.loadCategories()
        self.stockNews = interactor.loadNews()
    }
    
    func getCategories() -> [Category] { categories }
    func getNews() -> [StockNews] { stockNews }
}
