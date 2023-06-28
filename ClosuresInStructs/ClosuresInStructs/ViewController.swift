//
//  ViewController.swift
//  ClosuresInStructs
//
//  Created by Ravi Dwivedi on 26/06/23.
//

import UIKit


struct Car {
    var speed: Float = 0.0
    var increaseSpeed: (() -> ())?
}


class ViewController: UIViewController {
    
    
    
    var someInteger = 2
    
    let closure = {
        print("SomeInteger")
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        var myCar = Car()
        myCar.increaseSpeed = { [weak self]  in
            myCar.speed += 30 // The retain cycle occurs here. We cannot use [weak myCar] as myCar is a value type.
        }
        myCar.increaseSpeed?()
        print("My car's speed :")
        print(myCar.speed) // Prints 30

        let myNewCar = myCar
        myNewCar.increaseSpeed?()
        myNewCar.increaseSpeed?()
        print("My new car's speed :")
        print(myNewCar.speed) // Prints 30 still!
        
        
        
        someInteger = 3
        
        closure()
    }


}

