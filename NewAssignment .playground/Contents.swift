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

