//
//  ArrayExtensions.swift
//  
//
//  Created by Ravi Dwivedi on 25/09/25.
//

import XCTest

class ArrayExtensions: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
         super.tearDown()
    }
    
    func test_check_Array_Element_Lenght(){
        let numbers = [1,2,3,4,5,6]
        let num1 = numbers[safeIndex: 0]
        XCTAssertEqual(num1, 1)
    }

    func test_check_Array_Range_OutOfRange(){
        let numbers = [1,2,3,4,5,6]
        let num1 = numbers[safeIndex: 10]
        XCTAssertEqual(num1, nil)
    }
}
