//
//  AUIMaximumLenghtTextInputValidatorUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 28.07.2020.
//

import XCTest
import AUIKit

class AUIMaximumLenghtTextInputValidatorUnitTesting: XCTestCase {
    
    func testTextInputLengthGreaterThanMaximumLength() {
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let textInput = "abcdefghijklmn"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputLengthEqualToMaximumLength() {
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let textInput = "abcdefghij"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputLengthLessThanMaximumLength() {
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let textInput = "abcdefghi"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputEmpty() {
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputNil() {
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let textInput: String? = nil
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }

}
