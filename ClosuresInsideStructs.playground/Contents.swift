import UIKit

//Closures inside structs

struct Car {
    var speed:Double = 0.0
    var increaseSpeed:(()->())?
}

var myCar = Car()
myCar.increaseSpeed = {
    myCar.speed += 40  // will this create retain cycle ??
    // using weak self going to work ? or  what should be the way of dealing with memory leak
}
myCar.increaseSpeed?()
print("My car's speed:")
print(myCar.speed)

var myNewCar = myCar
myNewCar.increaseSpeed?()
print("My new car's speed:")
print(myNewCar.speed)


// Actor Keywords

// Concurrency
// Semaphore
// Locks


// Actors are Refrence types who is just like classes, but on top of it has the capability to handle the data race in the concurrent environment .


// What is data race ?
// Answer - Data race and race conditions are two distinct terms here we are going to discuss about data race only
//  Data race is the conditions where multiple threads access shared memory location in a concurrent enviroment
// without any locks or checks

// Modify the shared resource or shared memory location

//Impact of data race on the shared resource

// 1- Unstable state
// 2 - corrupt memory
// 3 - Unexpected behavior
//  4 - Crash

// Data Race are hard to debug


actor PhoneStocks{
    
    var stocks:Array<String> = ["iPhone 13","Samsung s 21","Pixel 4"]
    
    func getAvaiablePhones(){
        print("aviable phones for purcase are = \(stocks)")
    }
    
    func purchase(phone:String){
        
        guard let index = stocks.firstIndex(of: phone) else {
            print("No such phone in the stocks")
            return
        }
        stocks.remove(at: index)
        print("Congratulation on purchase of a new \(phone)")
    }
    
}


let phoneStocks = PhoneStocks()
let dispactch = DispatchQueue(label:"MyQueue",attributes: .concurrent)

dispactch.async {
    Task{
        await phoneStocks.getAvaiablePhones()
    }
}

dispactch.async {
    Task {
        await phoneStocks.purchase(phone:"iPhone 13")
    }
}


enum Directions:String,CaseIterable{
    case north = "North"
    case south = "South"
    case east = "East"
    case west = "West"
}


var arr = [10, 30, 60, 20, 50, 60]

func findTheLargestNumber(inputArr:[Int]) -> [Int]{
  var tempArr = inputArr
    for i in 0..<tempArr.count{
      for j in i+1..<tempArr.count{
       if(tempArr[i]<tempArr[j]){
          let temp = tempArr[j]
          tempArr[j] = tempArr[i]
          tempArr[i] = temp
       }
      }
    }
  return tempArr
}
let resultedArr = findTheLargestNumber(inputArr: arr)
print(resultedArr)
