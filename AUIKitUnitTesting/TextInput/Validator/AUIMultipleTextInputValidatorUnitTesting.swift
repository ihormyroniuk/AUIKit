//
//  AUICompositeTextInputValidatorUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 29.07.2020.
//

import XCTest
import AUIKit

class AUIMultipleTextInputValidatorUnitTesting: XCTestCase {

    func testTextInputLengthGreaterThanMaximumLengthWithOnlyAllowedCharacters() {
        let maximumLength: UInt = 10
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUIMultipleTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "72457575424234234"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as not valid because its length (\(textInput.count) symbol(s)) greater than required maximum lenght (\(maximumLength).")
    }
    
    func testTextInputLengthEqualToMaximumLengthWithOnlyAllowedCharacters() {
        let maximumLength: UInt = 10
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUIMultipleTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "1425212933"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as valid because its length (\(textInput.count) symbol(s)) equal to required maximum lenght (\(maximumLength) and it contains only allowed symbols.")
    }
    
    func testTextInputLengthLessThanMaximumLengthWithOnlyAllowedCharacters() {
        let maximumLength: UInt = 10
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUIMultipleTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "1425233"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as valid because its length (\(textInput.count) symbol(s)) less than required maximum lenght (\(maximumLength) and it contains only allowed symbols.")
    }
    
    func testTextInputLengthGreaterThanMaximumLengthWithSomeAllowedCharacters() {
        let maximumLength: UInt = 10
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUIMultipleTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "saf724575754fffs24234234"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as not valid because its length (\(textInput.count) symbol(s)) greater than required maximum lenght (\(maximumLength) and it contains only not allowed symbols.")
    }
    
    func testTextInputLengthLessThanMaximumLengthWithSomeAllowedCharacters() {
        let maximumLength: UInt = 10
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUIMultipleTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "z>f42f3a3"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as not valid because it contains some not allowed symbols.")
    }
    
    func testTextInputEmpty() {
        let maximumLength: UInt = 10
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUIMultipleTextInputValidator(textInputValidators: textInputValidators)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Empty text input \"\(textInput)\" has to be recognized as valid because it contains only allowed symbols and empty text input length (0 symbols) less than or equal to required maximum lenght (\(maximumLength).")
    }
    
    func testTextInputNil() {
        let maximumLength: UInt = 10
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUIMultipleTextInputValidator(textInputValidators: textInputValidators)
        let textInput: String? = nil
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Nil text input \"\(String(describing: textInput))\" has to be recognized as valid because nil text input is always valid.")
    }
    
}
