import UIKit

// DispatchGroup
// Group of task it is useful



//var str = "Hello, World!"
//var myClosure = { [str] in
//print (str)
//}
//str = "next"
//let inc = myClosure
//inc()
//


var str = "Hello World"

var myClousre = { [str] in
    print(str)
}

str = "Next"

let inc = myClousre
inc()
