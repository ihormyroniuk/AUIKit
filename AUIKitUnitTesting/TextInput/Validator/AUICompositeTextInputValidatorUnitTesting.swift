//
//  AUICompositeTextInputValidatorUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 29.07.2020.
//

import XCTest
import AUIKit

class AUICompositeTextInputValidatorUnitTesting: XCTestCase {

    func testTextInputLengthGreaterThanMaximumLengthWithOnlyAllowedCharacters() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "72457575424234234"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputLengthEqualToMaximumLengthWithOnlyAllowedCharacters() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "1425212933"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputLengthLessThanMaximumLengthWithOnlyAllowedCharacters() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "1425233"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputLengthGreaterThanMaximumLengthWithSomeAllowedCharacters() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "saf724575754fffs24234234"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputLengthEqualToMaximumLengthWithSomeAllowedCharacters() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "1425asf2ff"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputLengthLessThanMaximumLengthWithSomeAllowedCharacters() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        let textInput = "z>f42f3a3"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputEmpty() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
    func testTextInputNil() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let textInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        let textInput: String? = nil
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Actual isValid [\(String(describing: actualIsValid))] is not equal to [\(expectedIsValid)]")
    }
    
}
