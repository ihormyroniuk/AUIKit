//
//  AUINotAllowedCharactersTextInputValidator.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 29.07.2020.
//

import XCTest
import AUIKit

class AUINotAllowedCharactersTextInputValidatorUnitTesting: XCTestCase {

    func testTextInputWithOnlyAllowedCharacters() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = "jsgnjdsjfgjjdgf _----"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputWithOnlyNotAllowedCharacters() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = "13957378383131"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputWithSomeAllowedCharacters() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = "55jf3sg16njds2jfg2jj2dgf _33"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputEmpty() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputNil() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
}
