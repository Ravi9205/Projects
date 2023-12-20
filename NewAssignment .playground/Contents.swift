import UIKit




func checkPalindromeNumber(num:Int) {
    var remainder = 0
    var reverse = 0
    var newNum = num
    while(newNum != 0){
        remainder =  newNum % 10
        reverse = reverse * 10 + remainder
        newNum /= 10
    }
    
    if reverse ==  num {
        print("\(num) is a palindrome number")
    }
    else
    {
        print(" \(num) is not a palindrome number")
    }
    
}

checkPalindromeNumber(num: 152)

//added New opportunity by the new Technology Stack
// Newly added Behaviour and newly Added Coding standards

enum Direction: String , CaseIterable {
    case North
    case south
    case East
    case West
}

struct Test{
    
    func handleDirection(_direction:String) -> String {
        return Direction.allCases.filter{
            $0.rawValue.lowercased().elementsEqual(_direction.lowercased())}.first?.rawValue ?? "No Valid direction specified"
        
    }
}


let obj = Test()
print(obj.handleDirection(_direction:"north"))
print(obj.handleDirection(_direction:"east"))
print(obj.handleDirection(_direction:"west"))
print(obj.handleDirection(_direction:"south"))




//Ques1. If we have created a timer in viewWillAppear of VC-A and we don't invalidate that timer and we navigate to VC-B. We perform some task on VC-B and navigate back to VC-A. Now viewWillAppear of VC-A will create another timer instance. In this scenario how will the code behaviour will be and what will happen to the previous instance timer?

//Ques2. Custom implementation of higher order functions?

//Ques3. How to cache API response and use that rather than hitting the API again?

//Ques4. What will be the output of the below source code:

struct Pizza {
    let ingredients: [String]
}

protocol Pizzeria {
    func makePizza( ingredients: [String]) -> Pizza
    
    func makeMargherita() -> Pizza
}

extension Pizzeria {
    func makeMargherita() -> Pizza {
        return makePizza(ingredients: ["tomato", "mozzarella"])
    }
    
}


struct MyRestaurent: Pizzeria {
    func makePizza( ingredients: [String]) -> Pizza {
        return Pizza(ingredients: ingredients)
    }
    
    func makeMargherita() -> Pizza {
        return makePizza(ingredients: ["tomato", "basil", "mozzarella"])
    }
    
}
let retro1: Pizzeria = MyRestaurent()

let retro2: MyRestaurent = MyRestaurent()
retro1.makeMargherita()
retro2.makeMargherita()

//Ques5. If we have a private class with some properties. Can we access those properties in the extension of that class? Also, can that extension be created in another file?

// No it can't be accessable due to private protection , If it is computed property may be but if it is stored property then definatelty not cos stored property can't be used in an extensions and also with private protection level no  it definately not . yes an extension can be created in an another file cos that's why the sole concept of bringing the extensions into the picture they can be easily accessable from any where.





//Ques6. What is APN (Apple Push Notification) payload size limit? (maximum limit)
//Answer - Apple Push Notification service (APNs) refuses a notification if the total size of its payload exceeds the following limits: For Voice over Internet Protocol (VoIP) notifications, the maximum payload size is 5 KB (5120 bytes). For all other remote notifications, the maximum payload size is 4 KB (4096 bytes).


//Ques7. What is type erasure in Swift?
//Answer - Type erasure in Swift can be explained as the process of enforcing type constraints only at compile time and discarding the element type information at runtime.

//Ques8. What will be the output of the below code:

struct PhysicsMarks {
    var marksOfStudents: [Int]
    lazy var maxMarks: Int? = {
        return marksOfStudents.max()
    }()
    
    init(marks: [Int]) {
        self.marksOfStudents = marks
    }
}

var physicsMarks = PhysicsMarks(marks: [12, 14, 15, 16, 17, 10])
print(physicsMarks.maxMarks ?? 0)
physicsMarks.marksOfStudents.append(19)
print(physicsMarks.maxMarks ?? 0)

// OutPut - 17
// OutPut - 17

private class Student {
    
    private var name:String
    private var id:Int
    private var address:String
    
    init(name:String,id:Int,address:String) {
        self.name = name
        self.id = id
        self.address = address
    }
    
    private func printInfo()-> String{
        return name
    }
}

extension Array {
    
    func filterElements(isIncluded:(Element) -> Bool) -> [Element] {
        var result = [Element]()
        forEach { element in
            if isIncluded(element) {
                result.append(element)
            }
            
        }
        return result
    }
}

let a = [1,2,3,4,5]
print(a.filterElements(isIncluded: {$0 % 2 == 0}))


let cast = ["vivien", "Marlon","Kim","Karl"]

let lowercaseNames = cast.map({$0.lowercased()})

print(lowercaseNames)


let letterCounts = cast.map({$0.count})

print(letterCounts)


// Better way of acheieving this using Array extensions

extension Array{
    func myMap<Transform>(transform:(Element)-> Transform) -> [Transform]{
        var result = [Transform]()
        forEach { element in
            result.append(transform(element))
        }
        return result
    }
}
print(a.myMap(transform: {$0*2}))

// CompactMap

extension Array {
 func myCompactMap<Transform>(transform:(Element)->Transform?) -> [Transform]{
       var result = [Transform]()
     
     forEach { element in
         
         if let transformedEntity = transform(element) {
             result.append(transformedEntity)
         }
     }
     return result
    }
}


let arrayElement = ["1","2","shdh"]
print(arrayElement.compactMap({Int($0)}))


//Reduce
extension Array{
    func myReduce<Result>(_initialResult:Result,_ nextPartialResult:(Result,Element)-> Result) -> Result{
        var result = _initialResult
        forEach {
            result = nextPartialResult(result,$0)
        }
        return result
        
    }
}

let numbers = [1,2,3,4]

let numberSum = numbers.myReduce(_initialResult: 0) { sum, element in
    sum + element
}

print(numberSum)


var randomArray: [Int] = [1,2,3,4,5]

for i in randomArray {
    print(i)
    randomArray.append(i)
}

print(randomArray)



var arrList = [3, 4, 19, 4, 18, 3, 25, 3, 22]

func secondlargestElement(a:[Int])->Int{
   var arr = a
   for x in 0..<arr.count{
      for y in x+1..<arr.count{
         if (arr[x]>arr[y]) {
            let t = arr[x]
            arr[x] = arr[y]
            arr[y] = t
         }
      }
   }
   return arr[arr.count-2]
}

let result  = secondlargestElement(a: arrList)
print("second largest element in the array list \(result)")
