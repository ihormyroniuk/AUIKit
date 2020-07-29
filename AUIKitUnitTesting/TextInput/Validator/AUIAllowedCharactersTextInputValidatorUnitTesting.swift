//
//  AUIAllowedCharactersTextInputValidatorUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 29.07.2020.
//

import XCTest
import AUIKit

class AUIAllowedCharactersTextInputValidatorUnitTesting: XCTestCase {

    func testTextInputWithOnlyAllowedCharacters() {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInput = "13957378383131"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputWithOnlyNotAllowedCharacters() {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInput = "jsgnjdsjfgjjdgf _----"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputWithSomeAllowedCharacters() {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInput = "55jf3sg16njds2jfg2jj2dgf _33"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputEmpty() {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputNil() {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
}
