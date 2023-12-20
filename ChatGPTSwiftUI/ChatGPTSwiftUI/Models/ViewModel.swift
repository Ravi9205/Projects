//
//  ViewModel.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 15/11/23.
//

import Foundation
import SwiftUI
import AVKit

class ViewModel: ObservableObject {
    
    @Published var isInteractingWithChatGPT = false
    @Published var messages: [MessageRow] = []
    @Published var inputMessage: String = ""
    
    #if !os(watchOS)
    private var synthesizer: AVSpeechSynthesizer?
    #endif
    
    private let api: ChatGPTAPI
    
    init(api: ChatGPTAPI, enableSpeech: Bool = false) {
        self.api = api
        #if !os(watchOS)
        if enableSpeech {
            synthesizer = .init()
        }
        #endif
    }
    
    @MainActor
    func sendTapped() async {
        let text = inputMessage
        inputMessage = ""
        #if os(iOS)
        await sendAttributed(text: text)
        #else
        await send(text: text)
        #endif
    }
    
    @MainActor
    func clearMessages() {
        api.deleteHistoryList()
        withAnimation { [weak self] in
            self?.messages = []
        }
    }
    
    @MainActor
    func retry(message: MessageRow) async {
        guard let index = messages.firstIndex(where: { $0.id == message.id }) else {
            return
        }
        self.messages.remove(at: index)
        #if os(iOS)
        await sendAttributed(text: message.response?.text ?? "")
        #else
        await send(text: message.sendText)
        #endif
    }
    
    
    //MARK:- Loading chat conversation based on Id filter
    @MainActor
    func loadChatHistory(id:String)  async{
        let chatHistory = Bundle.main.decode([ChatHistoryModel].self, from:"chat.json")
        for item in chatHistory {
            if item.conversation_id == id {
                let parsingTask = ResponseParsingTask()
                let attributedStr =  await parsingTask.parse(text: item.response ?? "")
                
                let messageRow = MessageRow(
                    isInteractingWithChatGPT: false,sendImage:"profile",send:.rawText(item.prompt ?? ""),
                    message_id:item.message_id, prompt:item.prompt,
                    conversation_id:id, misc:item.misc ?? "",
                    responseImage: "openai",
                    response: .attributed(attributedStr))
                    self.messages.append(messageRow)
                
            
            }
            else
            {
                self.messages.removeAll()
            }
        }
    }
    #if os(iOS)
    @MainActor
    private func sendAttributed(text: String) async {
        isInteractingWithChatGPT = true
        
        let parsingTask = ResponseParsingTask()
        let attributedSend = await parsingTask.parse(text: text)
        
        var streamText = ""
        var messageRow = MessageRow(
            isInteractingWithChatGPT: true,sendImage:"profile",send:.attributed(attributedSend),
            message_id: "profile", prompt:"what is an Open AI?",
            conversation_id:"19qehwqe", misc:"misc",
            responseImage: "openai",
            response: nil)
        
        self.messages.append(messageRow)
        
        let parserThresholdTextCount = 64
        var currentTextCount = 0
        var currentOutput: AttributedOutput?
        
        do {
            let stream = try await api.sendMessageStream(text: text)
            for try await text in stream {
                streamText += text
                currentTextCount += text.count
                
                if currentTextCount >= parserThresholdTextCount || text.contains("```") {
                    currentOutput = await parsingTask.parse(text: streamText)
                    currentTextCount = 0
                }

                if let currentOutput = currentOutput, !currentOutput.results.isEmpty {
                    let suffixText = streamText.trimmingCharacters(in: .whitespacesAndNewlines)
                    var results = currentOutput.results
                    let lastResult = results[results.count - 1]
                    var lastAttrString = lastResult.attributedString
                    if lastResult.isCodeBlock {
                        lastAttrString.append(AttributedString(String(suffixText), attributes: .init([.font: UIFont.systemFont(ofSize: 12).apply(newTraits: .traitMonoSpace), .foregroundColor: UIColor.white])))
                    } else {
                        lastAttrString.append(AttributedString(String(suffixText)))
                    }
                    results[results.count - 1] = ParserResult(attributedString: lastAttrString, isCodeBlock: lastResult.isCodeBlock, codeBlockLanguage: lastResult.codeBlockLanguage)
                    messageRow.response = .attributed(.init(string: streamText, results: results))
                } else {
                    messageRow.response = .attributed(.init(string: streamText, results: [
                        ParserResult(attributedString: AttributedString(stringLiteral: streamText), isCodeBlock: false, codeBlockLanguage: nil)
                    ]))
                }

                self.messages[self.messages.count - 1] = messageRow
            }
        } catch {
            messageRow.responseError = error.localizedDescription
            messageRow.response = .rawText(streamText)
        }
        
        if let currentString = currentOutput?.string, currentString != streamText {
            let output = await parsingTask.parse(text: streamText)
            messageRow.response = .attributed(output)
        }
        
        messageRow.isInteractingWithChatGPT = false
        self.messages[self.messages.count - 1] = messageRow
        isInteractingWithChatGPT = false
    }
    #endif
    @MainActor
    private func send(text: String) async {
        isInteractingWithChatGPT = true
        var streamText = ""
        
        var messageRow = MessageRow(
            isInteractingWithChatGPT: true,sendImage:"237adg",
            send: .rawText(text),
            message_id:"2389",
            prompt: "What is Open AI?",
            conversation_id:"278akgh", misc:"misc", responseImage:"Profile")
        
        self.messages.append(messageRow)
        
        do {
            let stream = try await api.sendMessageStream(text: text)
            for try await text in stream {
                streamText += text
                messageRow.response = .rawText(streamText.trimmingCharacters(in: .whitespacesAndNewlines))
                self.messages[self.messages.count - 1] = messageRow
            }
        } catch {
            messageRow.responseError = error.localizedDescription
        }
        
       // messageRow.isInteractingWithChatGPT = false
        self.messages[self.messages.count - 1] = messageRow
        isInteractingWithChatGPT = false
        
    }
}
