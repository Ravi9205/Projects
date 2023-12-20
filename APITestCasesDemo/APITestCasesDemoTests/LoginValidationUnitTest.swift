//
//  LoginValidationUnitTest.swift
//  APITestCasesDemoTests
//
//  Created by Ravi Dwivedi on 14/07/23.
//

import XCTest

@testable import APITestCasesDemo

class LoginValidationUnitTest: XCTestCase {

   
    func test_LoginValidation_With_EmptyStrings_returns_validationFaliure(){
        
        //ARRANGEMENT
        let request = LoginRequest(useremail:"", userPassword:"")
        let validation = LoginValidation()
        
        //ACT
        let result =  validation.validate(request: request)
        
        //Assert
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message,"email or password can't be an empty")
        
    }
    
    
    func test_LoginValidation_With_EmptyPassword_returns_validationFaliure(){
        
        //ARRANGEMENT
        let request = LoginRequest(useremail:"ravi@gmail.com", userPassword:"")
        let validation = LoginValidation()
        
        //ACT
        let result =  validation.validate(request: request)
        
        //Assert
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message,"email or password can't be an empty")
        
    }
    
    
    func test_LoginValidation_With_EmptyEmail_returns_validationFaliure(){
        
        //ARRANGEMENT
        let request = LoginRequest(useremail:"", userPassword:"124435")
        let validation = LoginValidation()
        
        //ACT
        let result =  validation.validate(request: request)
        
        //Assert
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message,"email or password can't be an empty")
        
    }
    
    
    func test_LoginValidation_With_Valid_Request_Retuns_Success(){
        
        //ARRANGEMENT
        let request = LoginRequest(useremail:"test@gmail.com", userPassword:"124435")
        let validation = LoginValidation()
        
        //ACT
        let result =  validation.validate(request: request)
        
        //Assert
        XCTAssertTrue(result.isValid)
        XCTAssertNil(result.message)
        
    }
    
    func test_LoginValidation_With_Invalid_EmailId_Retuns_ValidationFaliure(){
        
        //ARRANGEMENT
        let request = LoginRequest(useremail:"test", userPassword:"124435")
        let validation = LoginValidation()
        
        //ACT
        let result =  validation.validate(request: request)
        
        //Assert
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message,"email id is invalid")
        
    }

}
