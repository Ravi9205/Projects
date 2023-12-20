//
//  EmployeePayroll.swift
//  AsyncAwaitDemo
//
//  Created by Ravi Dwivedi on 25/07/23.
//

import Foundation




struct EmployeePayroll:Decodable{
    var data:[Employee]?
}

struct Employee:Decodable{
    var employeeName:String
    var employeeId:Int
    var employeeSalary:Double
}
