//
//  NewsListViewModel.swift
//  DailyJournalApp
//
//  Created by user on 12/21/23.
//

import Foundation

class NewsListViewModel: ObservableObject {
    // MARK: - NewsList Properties
    @Published var news: [NewsItem] = []
    @Published var showingAddNewsView = false
    
    // MARK: - Form Input Properties
    @Published var newsForm = NewsForm()
    @Published var showingAlert = false
    
    // MARK: - Methods
    func deleteNews(at offsets: IndexSet) {
        news.remove(atOffsets: offsets)
    }
    
    func moveNews(from source: IndexSet, to destination: Int) {
        news.move(fromOffsets: source, toOffset: destination)
    }
    
    func saveNews() {
        guard newsForm.isValid else {
            showingAlert = true
            return
        }
        
        let newsItem = NewsItem(
            title: newsForm.title,
            description: newsForm.description,
            category: newsForm.category
        )
        
        news.append(newsItem)
        showingAddNewsView = false
        newsForm.reset()
    }
    
    // MARK: - Inner Struct for Form Input
    struct NewsForm {
        var title = ""
        var description = ""
        var category = NewsCategory.worldNews
        var date = Date()
        
        var isValid: Bool {
            return !title.isEmpty && !description.isEmpty
        }
        
        mutating func reset() {
            title = ""
            description = ""
            category = .worldNews
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
