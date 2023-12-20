//
//  APIManager.swift
//  GPTAI
//
//  Created by Ravi Dwivedi on 09/11/23.
//

import Foundation

import OpenAISwift

final class APIManger {
    
    static let shared  = APIManger()
    private var client:OpenAISwift?
    
    private init(){}
    
    //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
    //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
    
    public func setUp(){
        self.client =  OpenAISwift(authToken:"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")
       
        
    }
    
    //sk-EskHrhCcstpTFQpn61cCT381bkFJD2ny5KKmsNyzW3vyV6XI
    //MARK:- API Calling with input parameter
    public func getResponse(input:String,completion:@escaping(Result<String,Error>)->Void){
        
        client?.sendCompletion(with: input, maxTokens: 500, completionHandler: { result  in
            switch result{
            case .success(let model):
                print(String(describing: model.choices))
                let result = model.choices?.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                completion(.success(result))
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
