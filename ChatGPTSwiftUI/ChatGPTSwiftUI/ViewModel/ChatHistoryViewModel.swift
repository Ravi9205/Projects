//
//  HistoryViewModel.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 23/11/23.
//

import Foundation


class ChatHistoryViewModel: ObservableObject {
    @Published var conversationHistory = [ConversationHistoryModel]()
    let history = Bundle.main.decode([ConversationHistoryModel].self, from:"history.json")
    @Published var searchText: String = ""

    init() {
        conversationHistory = history
    }
    
    var filteredHistory: [ConversationHistoryModel] {
        guard !searchText.isEmpty else { return conversationHistory }
        return conversationHistory.filter { history in
            history.title.lowercased().contains(searchText.lowercased())
        }
    }
}
