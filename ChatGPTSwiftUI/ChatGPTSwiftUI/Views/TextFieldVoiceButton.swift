//
//  TextFieldVoiceButton.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 15/12/23.
//

import SwiftUI

struct TextFieldVoiceButton: ViewModifier {
    @Binding var text: String
    @State private var isSpeechTapped:Bool = false
    @ObservedObject private var speechAnalyzer = SpeechAnalyzer()

    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if text.isEmpty {
                Button(
                    action: { self.text = ""
                        toggleSpeechRecognition()
                        print(speechAnalyzer.recognizedText ?? "")
                    },
                    
                    label: {
                        Image(systemName: "mic.fill")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
            
        }
    }
}

 private extension TextFieldVoiceButton {
    func toggleSpeechRecognition() {
        if speechAnalyzer.isProcessing {
            speechAnalyzer.stop()
        } else {
            speechAnalyzer.startRecording()
        }
    }
}

