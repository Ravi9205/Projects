import UIKit
import Foundation

import PlaygroundSupport


func printGoodMorningMessage(isMorning:Bool,name:@autoclosure () -> String){
    
    debugPrint("printGoodMoringMessage")
    if isMorning {
        debugPrint("Good Morning \(name())")
    }
    
}


func assignName(name:String) -> String{
    
    debugPrint("assign Name is called ")
    return name
}


//
//printGoodMorningMessage(isMorning: true, name: assignName(name:"Ravi"))
//
//printGoodMorningMessage(isMorning: false , name:"codecat15")

//printGoodMorningMessage(isMorning: false) {
//    assignName(name: "Ravi")
//}

printGoodMorningMessage(isMorning: false, name:"Ravi")


// Higher order function

// 1  Higher order function accept other functions as input parameter .


//2. They may return a function as an output.

// They may return a function as an output.

func sayGoodMorning(name:String){
    debugPrint("Good morning \(name)")
}

func greetUser(message:(String) -> Void){
                         //Closure as input paremeter
    message("codecat15")
}



// Function returning another function
func createGoodMoringGreetingFunction(userName:String) -> () -> String{
    func helloWorldFunction() ->  String{
        return "Good morning \(userName)"
    }
    return helloWorldFunction
}


//let hellowWorldFunction = createGoodMoringGreetingFunction(userName:"codecat15")
//debugPrint(hellowWorldFunction())


struct EndPoints{
    static let getEvents = "https://demo0333988.mockable.io/getEvents"
}

class HttpClient {
    
    func getData(url:URL, completionHandler:@escaping (_ _data: Data?) -> Void){
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            completionHandler(dataResponse)
            PlaygroundPage.current.finishExecution()
            
        }
        .resume()
    }
    
}


class Events{
    
    var clients:HttpClient
    
    init(_client:HttpClient) {
        self.clients = _client
    }
    
    func getEventsRecords(){
        
        guard let url = URL(string: EndPoints.getEvents) else {
            return
        }
        
        self.clients.getData(url: url) { dataResponse in
            
            if dataResponse?.count != 0 {
                debugPrint("Response data =\(String(describing: dataResponse?.count))")
            }
        }
               
    }
    
}

//let objEvent = Events(_client: HttpClient())
//objEvent.getEventsRecords()


//class User {
//
//    func authenticate(){
//        //Authenticate User
//    }
//
////    func getUserData() -> UserData{
////
////    }
//}


class Authenticator {
    
    func authenticate(){
        //Logic
    }
}


struct UserData{
    let userName:String
    let userID:String
    let address:String
}
class UserDataRetriver {
    func getUserData() -> UserData {
        return UserData(userName:"", userID: "", address:"")
    }
}


class User
{
    let autheticator = Authenticator()
    let userDataRetriver = UserDataRetriver()
    
    func authenticate(){
        autheticator.authenticate()
    }
    
    func getUserData() -> UserData{
        return userDataRetriver.getUserData()
    }
}


//DIP

protocol DataFetching :AnyObject{
    func fetchData(from url:URL) -> Data?
}

class DataFetcher:DataFetching{
    func fetchData(from url: URL) -> Data? {
        // Logic
        return Data()
    }
}

class DataManager {
    weak var  dataFetcher:DataFetching?
    
    init(dataFetcher:DataFetching) {
        self.dataFetcher = dataFetcher
    }
    
    func getData() -> Data?{
        guard let url = URL(string:"https://example.com") else {
            fatalError("Invalid URL")
        }
        let data = dataFetcher?.fetchData(from: url)
        return data
    }
}


let dataFetcher = DataFetcher()
let dataManager = DataManager(dataFetcher: dataFetcher)
let data = dataManager.getData()


//// LSP
//
//class  Rectangle {
//    var width:Double
//    var height:Double
//
//    init(width:Double,height:Double){
//        self.width = width
//        self.height = height
//    }
//
//    func calculateArea() -> Double{
//        return width * height
//    }
//
//}
//
//class Sqaure:Rectangle {
//    override var width: Double{
//        didSet{
//            height = width
//        }
//
//    }
//
//    override var height: Double{
//
//        didSet{
//            width = height
//        }
//    }
//}
//
//// This voilates LSP


protocol AreaCalculator {
    var area:Double { get }
}

class Rectangle :AreaCalculator{

    var width:Double
    var height:Double
    
    init(width:Double,height:Double){
        self.width = width
        self.height = height
    }
    
    var area: Double {
        return width * height
    }
}


