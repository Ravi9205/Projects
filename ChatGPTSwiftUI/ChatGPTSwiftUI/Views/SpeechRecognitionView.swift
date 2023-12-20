//
//  SpeechRecognitionView.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 11/12/23.
//

import SwiftUI

struct SpeechRecognitionView: View {
    private enum Constans {
        static let recognizeButtonSide: CGFloat = 40
    }
    
    @ObservedObject private var speechAnalyzer = SpeechAnalyzer()
    var body: some View {
        VStack {
            Spacer()
            Text(speechAnalyzer.recognizedText ?? "Tap to begin")
                .padding()
            
            Button {
                toggleSpeechRecognition()
            } label: {
                Image(systemName: speechAnalyzer.isProcessing ? "waveform.circle.fill" : "waveform.circle")
                    .resizable()
                    .frame(width: Constans.recognizeButtonSide,
                           height: Constans.recognizeButtonSide,
                           alignment: .center)
                    .foregroundColor(speechAnalyzer.isProcessing ? .red : .gray)
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
        }
    }
}

private extension SpeechRecognitionView {
    func toggleSpeechRecognition() {
        if speechAnalyzer.isProcessing {
            speechAnalyzer.stop()
        } else {
            speechAnalyzer.startRecording()
        }
    }
}

struct SpeechRecognitionView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechRecognitionView()
    }
}
