//
//  APIManger.swift
//  ChatGPTNew
//
//  Created by Ravi Dwivedi on 08/11/23.
//

import Foundation
//import OpenAISwift

//MARK:- Singleton Pattern

final class APIManger {
    
    static let shared  = APIManger()
   // private var client:OpenAISwift?
    
    private init(){}
    
    
    public func setUp(){
        //self.client =  OpenAISwift(config: .makeDefaultOpenAI(apiKey:"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"))
        
    }
    
    /*
    
    //MARK:- API Calling with input parameter
    public func getResponse(input:String,completion:@escaping(Result<String,Error>)->Void){
        
        client?.sendCompletion(with: input,maxTokens: 500, completionHandler: { result  in
            switch result{
            case .success(let model):
                print(String(describing: model.choices))
                let result = model.choices?.first?.text ?? ""
                completion(.success(result))
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }

    */
    
    //MARK:- Method to Load the JSON File if there no Response from the server sides
    func loadJsonFiles(filename fileName: String) -> [ResponseModel]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([ResponseModel].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
