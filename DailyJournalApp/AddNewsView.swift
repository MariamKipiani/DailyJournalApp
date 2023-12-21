//
//  AddNewsView.swift
//  DailyJournalApp
//
//  Created by user on 12/21/23.
//

import SwiftUI

struct AddNewsView: View {
    @EnvironmentObject var viewModel: NewsListViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("News Details")) {
                    TextField("Enter Title", text: $viewModel.newsForm.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 8)
                    
                    TextEditor(text: $viewModel.newsForm.description)
                        .frame(minHeight: 100)
                        .cornerRadius(8)
                        .padding(.vertical, 8)
                    
                    DatePicker("Date", selection: $viewModel.newsForm.date, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding(.vertical, 8)
                    
                    Picker("Category", selection: $viewModel.newsForm.category) {
                        ForEach(NewsCategory.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.vertical, 8)
                }
                
                Section {
                    Button("Add News") {
                        viewModel.saveNews()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .navigationBarTitle("Add News", displayMode: .inline)
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(
                    title: Text("Missing Information"),
                    message: Text("Please fill in all fields before adding news."),
                    dismissButton: .default(Text("Got it!"))
                )
            }
        }
        .padding()
    }
}
