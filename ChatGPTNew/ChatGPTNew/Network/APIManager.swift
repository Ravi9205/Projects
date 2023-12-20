//
//  APIManager.swift
//  ChatGPTNew
//
//  Created by Ravi Dwivedi on 08/11/23.
//

import Foundation
import OpenAISwift

final class APIManger {
    
    static let shared  = APIManger()
    private var client:OpenAISwift?
    
    private init(){}
    
    public func setUp(){
        self.client =  OpenAISwift(config: .makeDefaultOpenAI(apiKey: Tokens.secretKeys))
    }
    
    
    //MARK:- API Calling with input parameter
    public func getResponse(input:String,completion:@escaping(Result<String,Error>)->Void){
        
        client?.sendCompletion(with: input,model: .codex(.davinci), completionHandler: { result  in
            switch result{
            case .success(let model):
                let result = model.choices?.first?.text ?? ""
                completion(.success(result))
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
