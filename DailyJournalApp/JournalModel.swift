//
//  JournalModel.swift
//  DailyJournalApp
//
//  Created by user on 12/21/23.
//

import Foundation

struct NewsItem: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var date = Date()
    var category: NewsCategory
    var isFavorite: Bool = false
}

enum NewsCategory: String, CaseIterable, Identifiable {
    case worldNews = "World News"
    case science = "Science"
    case fashion = "Fashion"
    case travel = "Travel"
    case food = "Food"
    case environment = "Environment"

    var id: String { self.rawValue }
}
