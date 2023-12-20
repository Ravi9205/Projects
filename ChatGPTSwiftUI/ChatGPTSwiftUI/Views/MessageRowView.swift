//
//  MessageRowView.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 15/11/23.
//
//
//  MessageRowView.swift
//  XCAChatGPT
//
//  
//

import SwiftUI
#if os(iOS)
import Markdown
import WebKit
#endif

struct MessageRowView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    let message: MessageRow
    let retryCallback: (MessageRow) -> Void
    @Environment(\.openURL) private var openURL
    @State private var isMiscSelected = false
    @State private var isLoading = true
    @State private var error: Error? = nil
    @State private var showLikeDislike = false

    private let pasteBoard = UIPasteboard.general

    var imageSize: CGSize {
      #if os(iOS) || os(macOS)
        CGSize(width: 25, height: 25)
        #elseif os(watchOS)
        CGSize(width: 20, height: 20)
        #else
        CGSize(width: 80, height: 80)
        #endif
    }
    
    var body: some View {
        VStack(spacing: 0) {
            messageRow(rowType: message.send, misc: message.misc ?? "", image:"profile", bgColor: colorScheme == .light ? .white : Color(red: 52/255, green: 53/255, blue: 65/255, opacity: 0.5))
            
            
            if let response = message.response {
                Divider()
                messageRow(rowType: response, misc: message.misc ?? "", image:"gpt", bgColor: colorScheme == .light ? .gray.opacity(0.1) : Color(red: 52/255, green: 53/255, blue: 65/255, opacity: 1), responseError: message.responseError, showDotLoading: message.isInteractingWithChatGPT)
                Divider()
                
            }
        }
    }
    
    func messageRow(rowType: MessageRowType,misc:String, image: String, bgColor: Color, responseError: String? = nil, showDotLoading: Bool = false) -> some View {
        #if os(watchOS)
        VStack(alignment: .leading, spacing: 8) {
            messageRowContent(rowType: rowType, image: image, responseError: responseError, showDotLoading: showDotLoading)
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(bgColor)
          #else
        HStack(alignment: .top, spacing: 24) {
            messageRowContent(rowType: rowType, misc: misc, image: image, responseError: responseError, showDotLoading: showDotLoading)
        }
          #if os(tvOS)
        .padding(32)
          #else
        .padding(16)
         #endif
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(bgColor)
          #endif
    }
    
    @ViewBuilder
    func messageRowContent(rowType: MessageRowType,misc:String, image: String, responseError: String? = nil, showDotLoading: Bool = false) -> some View {
        if image.hasPrefix("http"), let url = URL(string: image) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: imageSize.width, height: imageSize.height)
            } placeholder: {
                ProgressView()
            }
            
        } else {
            Image(image)
                .resizable()
                .frame(width: imageSize.width, height: imageSize.height)
        }
        
        VStack(alignment: .leading) {
            switch rowType {
            case .attributed(let attributedOutput):
                attributedView(misc: misc, results: attributedOutput.results)
                
            case .rawText(let text):
                if !text.isEmpty {
              #if os(tvOS)
                    responseTextView(text: text)
                #else
                    Text(text)
                        .multilineTextAlignment(.leading)
                #if os(iOS) || os(macOS)
                        .contextMenu {
                            //MARK:- Like Button Tapped
                            Button {
                                print("Like Button Tapped")
                            } label: {
                                Label("Like", systemImage: "hand.thumbsup")
                            }
                            
                            Button {
                                print("DisLike Button Tapped")
                                
                            } label: {
                                Label("Dislike", systemImage: "hand.thumbsdown")
                            }
                        }
                 #endif
                 #endif
                }
            }
            
            if let error = responseError {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.leading)
                
                Button("Regenerate response") {
                    retryCallback(message)
                }
                .foregroundColor(.accentColor)
                .padding(.top)
            }
            
            if showDotLoading {
                #if os(tvOS)
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding()
                    #else
                DotLoadingView()
                    .frame(width: 60, height: 30)
                  #endif
            }
        }
    }
    
    func attributedView(misc:String,results: [ParserResult]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            
            ForEach(results) { parsed in
                if parsed.isCodeBlock {
                       #if os(iOS)
                    CodeBlockView(parserResult: parsed)
                        .padding(.bottom, 24)
                        #else
                    Text(parsed.attributedString)
                        #if os(iOS) || os(macOS)
                    //.textSelection(.enabled)
                        #endif
                        #endif
                }
                else {
                    Text(parsed.attributedString)
                        .contextMenu {
                            //MARK:- Like Button Tapped
                            
                            Button {
                                print("Like Button Tapped")
                            } label: {
                                Label("Like", systemImage: "hand.thumbsup")
                            }
                            
                            Button {
                                print("DisLike Button Tapped")
                                
                            } label: {
                                Label("Dislike", systemImage: "hand.thumbsdown")
                            }
                            
                            Button {
                                pasteBoard.string = ""
                                pasteBoard.string =  NSMutableAttributedString(parsed.attributedString).string
                                
                            } label: {
                                Label("Copy", systemImage: "doc.on.doc")
                            }
                        }
                      showMiscData(miscData: misc)
                    
                }
            }
        }
    }
    
    //MARK:- Misc Related Information If Any
    @ViewBuilder
    func showMiscData(miscData:String?) -> some View{
        if let miscData = miscData?.parseJSONString as? [String:Any] {
            if let miscArr = miscData["citations"] as? [String]{
                Text("Citations :")
                    .padding(.top,10)
                ForEach(miscArr,id:\.self){ miscInfo in
                    Spacer()
                    
                    Text("\(miscInfo.before(first:":"))")
                        .padding(.top,10)
                        .foregroundColor(Color(red: 161/255, green: 120/255, blue: 54/255))
                        .font(Font.body.bold())
                
                        .onTapGesture {
                            isMiscSelected.toggle()
                        }
                        .sheet(isPresented: $isMiscSelected) {
                            let link = miscInfo.after(first:":")
                            let newLink = link.after(first:":")
                            //Handle Error If Any
                            if let error = error {
                                VStack(alignment: .center, spacing: 20){
                                    Text(error.localizedDescription)
                                    .foregroundColor(.pink)
                                    .padding(.top)
                                    .multilineTextAlignment(.center)
                                }
                            }
                            else if let url = URL(string:newLink.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")  {
                                WebView(url: url, isLoading: $isLoading, error: $error)
                                    .edgesIgnoringSafeArea(.all)
                               
                               if isLoading {
                                   ProgressView()
                               }
                                
                            }
                            else{
                                VStack{
                                    Text("Sorry, we could not load this url.")
                                        .foregroundColor(.pink)
                                        .font(Font.body.bold())
                                        .padding(.top)

                                }
                            }
                      }
                }
            }
        }
    }
    
#if os(tvOS)
    private func rowsFor(text: String) -> [String] {
        var rows = [String]()
        let maxLinesPerRow = 8
        var currentRowText = ""
        var currentLineSum = 0
        
        for char in text {
            currentRowText += String(char)
            if char == "\n" {
                currentLineSum += 1
            }
            
            if currentLineSum >= maxLinesPerRow {
                rows.append(currentRowText)
                currentLineSum = 0
                currentRowText = ""
            }
        }
        
        rows.append(currentRowText)
        return rows
    }
    
    func responseTextView(text: String) -> some View {
        ForEach(rowsFor(text: text), id: \.self) { text in
            Text(text)
                .focusable()
                .multilineTextAlignment(.leading)
            
        }
    }
  #endif
}

//MARK:- WebView Loading Content With the App
struct WebView: UIViewRepresentable {
    var url: URL
    @Binding var isLoading: Bool
    @Binding var error: Error?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        init(_ parent: WebView) {
            self.parent = parent
        }
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
           // print("loading error: \(error)")
            parent.isLoading = false
            parent.error = error
            
        }
        
    }
}

struct MessageRowView_Previews: PreviewProvider {
    
    static let message = MessageRow(isInteractingWithChatGPT: true, sendImage:"profile", send: .rawText("what is Swift UI"), message_id:"71712", prompt:"what is Swift UI", conversation_id:"82291", misc:"misc", responseImage:"open AI", response: .rawText("hello how may I assit you"), responseError:"ChatGPT is currently not available")
    
    static let message2 = MessageRow(isInteractingWithChatGPT: true, sendImage:"profile", send: .rawText("what is Open AI"), message_id:"71712", prompt:"what is Open AI", conversation_id:"9237", misc:"misc", responseImage:"open AI", response: .rawText("hello I am Chat GPT  how may I assit you"), responseError:"ChatGPT is currently not available")
    
    
    static var previews: some View {
        NavigationView {
            ScrollView {
                MessageRowView(message: message, retryCallback: { messageRow in
                    
                })
                
                MessageRowView(message: message2, retryCallback: { messageRow in
                    
                })
                
            }
            .previewLayout(.sizeThatFits)
        }
    }
    
    static var responseMessageRowType: MessageRowType {
        #if os(iOS)
        let document = Document(parsing: rawString)
        var parser = MarkDownAttributedStringParser()
        let results = parser.parserResult(from: document)
        return MessageRowType.attributed(.init(string: rawString, results: results))
         #else
        MessageRowType.rawText(rawString)
        #endif
    }
    
    static var rawString: String {
        #if os(iOS)
        """
        ## Supported Platforms
        
        - iOS/tvOS 15 and above
        - macOS 12 and above
        - watchOS 8 and above
        - Linux
        
        ## Installation
        
        ### Swift Package Manager
        - File > Swift Packages > Add Package Dependency
        - Add https://github.com/alfianlosari/ChatGPTSwift.git
        
        ### Cocoapods
        ```ruby
        platform :ios, '15.0'
        use_frameworks!
        
        target 'MyApp' do
          pod 'ChatGPTSwift', '~> 1.3.1'
        end
        ```
        
        ## Requirement
        
        Register for API key from [OpenAI](https://openai.com/api). Initialize with api key
        
        ```swift
        let api = ChatGPTAPI(apiKey: "API_KEY")
        ```
        
        ## Usage
        
        There are 2 APIs: stream and normal
        
        ### Stream
        
        The server will stream chunks of data until complete, the method `AsyncThrowingStream` which you can loop using For-Loop like so:
        
        ```swift
        Task {
            do {
                let stream = try await api.sendMessageStream(text: "What is ChatGPT?")
                for try await line in stream {
                    print(line)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        ```
        
        ### Normal
        A normal HTTP request and response lifecycle. Server will send the complete text (it will take more time to response)
        
        ```swift
        Task {
            do {
                let response = try await api.sendMessage(text: "What is ChatGPT?")
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
        ```
        """
       #else
        "SwiftUI is a user interface framework that allows developers to design and develop user interfaces for iOS, macOS, watchOS, and tvOS applications using Swift, a programming language developed by Apple Inc."
         #endif
    }
}

