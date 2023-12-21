//
//  DailyJournalAppApp.swift
//  DailyJournalApp
//
//  Created by user on 12/20/23.
//

import SwiftUI

@main
struct DailyJournalApp: App {
    
    @StateObject var viewModel = NewsListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    NewsListView()
                        .tabItem {
                            Label("News", systemImage: "newspaper.fill")
                        }
                        .tag(0)
                    

                }

            }
            .environmentObject(viewModel)
        }
    }
    
    enum TabSelection: Int {
        case news, favorites
    }
    
    func tabBarTitle(for tabSelection: TabSelection?) -> String {
        switch tabSelection {
        case .news:
            return "Latest News"
        case .favorites:
            return "Your Favorites"
        default:
            return ""
        }
    }
}
