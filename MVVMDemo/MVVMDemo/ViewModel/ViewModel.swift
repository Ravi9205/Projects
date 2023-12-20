//
//  ViewModel.swift
//  MVVMDemo
//
//  Created by Ravi Dwivedi on 30/06/23.
//

import Foundation


struct  SumViewModel
{
    func addTwoNumber(firstNum:Int, secondNumber:Int) -> Int{
        guard firstNum > 0 && secondNumber > 0 else {
           return 0
        }
        let sum =  firstNum + secondNumber
        return sum
    }
}
