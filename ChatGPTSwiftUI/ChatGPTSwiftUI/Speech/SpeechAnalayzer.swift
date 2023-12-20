//
//  SpeechAnalayzer.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 11/12/23.
//

import Foundation
import Speech

final class SpeechAnalyzer: NSObject, ObservableObject, SFSpeechRecognizerDelegate {
    private let audioEngine = AVAudioEngine()
    private var inputNode: AVAudioInputNode?
    private var speechRecognizer =  SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    @Published var recognizedText: String?
    @Published var isProcessing: Bool = false
    
    
    
    
    func startRecording() {
        
           self.speechRecognizer?.delegate = self
            // Clear all previous session data and cancel task
            if recognitionTask != nil {
                recognitionTask?.cancel()
                recognitionTask = nil
            }
            // Create instance of audio session to record voice
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.record, mode: AVAudioSession.Mode.measurement, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            } catch {
                print("audioSession properties weren't set because of an error.")
            }

            self.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()

            let inputNode = audioEngine.inputNode

            guard let recognitionRequest = recognitionRequest else {
                fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
            }

            recognitionRequest.shouldReportPartialResults = true

            self.recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in


                if result != nil {
                   
                    self.recognizedText = result?.bestTranscription.formattedString ?? ""
                    print(self.recognizedText ?? "")
                    self.isProcessing = (result?.isFinal)!
                }

                if error != nil || self.isProcessing {
                    self.audioEngine.stop()
                    inputNode.removeTap(onBus: 0)
                    self.recognitionRequest = nil
                    self.recognitionTask = nil

                   // self.btnStart.isEnabled = true
                }
            })

            let recordingFormat = inputNode.outputFormat(forBus: 0)
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
                self.recognitionRequest?.append(buffer)
            }

            self.audioEngine.prepare()

            do {
                try self.audioEngine.start()
            } catch {
                print("audioEngine couldn't start because of an error.")
            }

           // self.lblText.text = "Say something, I'm listening!"
            
           print("Say something, I'm listening!")
        }



    /*
    
    func start() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Couldn't configure the audio session properly")
        }
        
        inputNode = audioEngine.inputNode
        
        speechRecognizer = SFSpeechRecognizer()
        print("Supports on device recognition: \(speechRecognizer?.supportsOnDeviceRecognition == true ? "✅" : "🔴")")

        // Force specified locale
         self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_US"))
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        // Disable partial results
         recognitionRequest?.shouldReportPartialResults = false
        
        // Enable on-device recognition
         recognitionRequest?.requiresOnDeviceRecognition = true

        guard let speechRecognizer = speechRecognizer,
              speechRecognizer.isAvailable,
              let recognitionRequest = recognitionRequest,
              let inputNode = inputNode
        else {
            assertionFailure("Unable to start the speech recognition!")
            return
        }
        
        speechRecognizer.delegate = self
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            recognitionRequest.append(buffer)
        }

        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            self?.recognizedText = result?.bestTranscription.formattedString
            
            guard error != nil || result?.isFinal == true else { return }
            self?.stop()
        }

        audioEngine.prepare()
        
        do {
            try audioEngine.start()
            isProcessing = true
        } catch {
            print("Coudn't start audio engine!")
            stop()
        }
    }
    
    */
    
    func stop() {
        self.recognitionTask?.cancel()
        
        self.audioEngine.stop()
        self.inputNode?.removeTap(onBus: 0)
        
        isProcessing = false
        
        self.recognitionRequest = nil
        self.recognitionTask = nil
        self.speechRecognizer = nil
        self.inputNode = nil
    }
    
     func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            print("✅ Available")
        } else {
            print("🔴 Unavailable")
            recognizedText = "Text recognition unavailable. Sorry!"
            stop()
        }
    }
    
    func speechRecognitionTask(_ task: SFSpeechRecognitionTask, didFinishSuccessfully successfully: Bool) {
        print("Task completed successfully")
    }

}
