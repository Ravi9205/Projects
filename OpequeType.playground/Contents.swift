import UIKit
import Darwin


// Generics - Way to write flexibale and resuable peace of code // Caller function decides the type and the function implementation is unaware of it instead the implmenation is in such way  that works with any type when I say any types means litrally any type.



func swapTwoValues<T>(_ a:inout T, _ b:inout T){
    let temp = a
    a = b
    b = temp
}



 // Associated type
protocol Stackable{
    associatedtype Item
    func push(item:Item)
    func pop() -> Item
}




protocol Container {
    associatedtype Item:Equatable
    mutating func append(_ item:Item)
    var count:Int { get }
    subscript(i:Int) ->Item { get  }
}

//Opaque type

enum CardType{
    case gold
    case platinum
}

protocol CardNumberProtocal{
    
}

extension String:CardNumberProtocal{
    
     
}

protocol Card {
    associatedtype CardNumber: CardNumberProtocal
    var types: CardType { get set}
    var limit:Int { get set}
    var number:CardNumber { get set}
    func validateCardNumber(number:CardNumber)
}


struct VisaCard:Card{
    var types: CardType = .gold
    typealias CardNumber = String
    var number: String = "4121-1256-1234-1233"
    var limit: Int = 100000
    
    
    func validateCardNumber(number: String) {
        
        
    }
}

struct MasterCard:Card{
    var types: CardType = .platinum
    typealias CardNumber = String
    var number: String = "5132-3356-7232-9862"
    var limit: Int = 50000
    
    
    func validateCardNumber(number: String) {
        
        
    }
}


func getLoanEligibility() -> Bool{
    getUserCard().limit >= getLoanEligibilityCard().limit
}


func getUserCard() -> some  Card{
   return MasterCard()
}

func getLoanEligibilityCard() -> some Card{
    return VisaCard()
}

