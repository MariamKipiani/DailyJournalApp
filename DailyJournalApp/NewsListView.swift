//
//  NewsListView.swift
//  DailyJournalApp
//
//  Created by user on 12/21/23.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var viewModel: NewsListViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.news.isEmpty {
                    emptyStateView
                } else {
                    newsList
                }
            }
            .navigationBarTitle("Latest Headlines", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {
                    viewModel.showingAddNewsView = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $viewModel.showingAddNewsView) {
                AddNewsView()
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack {
            Image(systemName: "newspaper.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            Text("No news articles yet!")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
            Text("Click on the ➕ button above to add some news.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
    
    private var newsList: some View {
        List {
            ForEach($viewModel.news) { $newsItem in
                VStack(alignment: .leading) {
                    Text(newsItem.title)
                        .font(.title)
                        .foregroundColor(.primary)
                    Text(newsItem.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    HStack {
                        Text(newsItem.category.rawValue)
                            .font(.caption)
                            .foregroundColor(.blue)
                        Spacer()
                        Text(viewModel.dateFormatter.string(from: newsItem.date))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(radius: 3))
            }
            .onDelete(perform: viewModel.deleteNews)
            .onMove(perform: viewModel.moveNews)
        }
        .listStyle(PlainListStyle())
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
            .environmentObject(NewsListViewModel())
    }
}

