import UIKit



var i = 0
var closureArray: [()->()] = []
for _ in 1...5 {
closureArray.append { [i] in
print(i)
}
i+=1
}

closureArray[0]()
closureArray[1]()
closureArray[2]()
print("i is (i)")
