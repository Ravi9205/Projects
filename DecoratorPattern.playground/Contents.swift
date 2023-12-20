import UIKit


//Decorator Design Pattern
//Decorator Design Pattern is a structral pattern
//using Decorators you can wrap objects countless number of time since both target objects and decorators  follow theh same interface. The Resulting objects will get a stacking behavior of all wrappers.

//We could use decorator Design patterns if we need to assign extra behavior to and object without  altering the existing one.

// Benefits of using Decorator Patterns
// 1 - Dynamic extension of funcationality
//2 - Changes in Runtime
// 3 - Combine Behaviors
// SRP (Single Responsibility Principles)



protocol Car {
    var upgrades:[String] { get}
    var price :Int { get}
    
}

protocol CarDecorator:Car{
    var car:Car {get}
}

struct BaseCar:Car{
    var upgrades: [String] = ["Engine"]
    var price: Int = 10_000
    
}


struct BaseWheels:CarDecorator{
    var car:Car
    var upgrades: [String]{
        car.upgrades + ["Base Wheels"]
    }
    
    var price: Int{
        car.price + 10_000
    }
    
}


struct SportWheels:CarDecorator{
    var car:Car
    var upgrades: [String]{
        car.upgrades + ["Sport Wheels"]
    }
    
    var price: Int{
        car.price + 3_000
    }
    
}



struct AirCondtion:CarDecorator{
    var car:Car
    var upgrades: [String]{
        car.upgrades + ["Air Condition"]
    }
    
    var price: Int{
        car.price + 2_000
    }
    
}


struct AutoPilot:CarDecorator{
    var car:Car
    var upgrades: [String]{
        car.upgrades + ["AutoPilot"]
    }
    
    var price: Int{
        car.price + 5_000
    }
    
}


var car = BaseCar()
car.price

var sportCar = SportWheels(car: car)
sportCar.price

var acCar = AirCondtion(car: sportCar)
acCar.price

var autoPilotCar = AutoPilot(car: acCar)
autoPilotCar.price

autoPilotCar.upgrades.forEach{print($0)}
