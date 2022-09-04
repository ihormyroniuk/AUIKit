import XCTest
import AUIKit

class AUIMaximumLenghtTextInputValidatorUnitTesting: XCTestCase {
    
    func testTextInputLengthGreaterThanMaximumLength() {
        let maximumLength: UInt = 10
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let textInput = "abcdefghijklmn"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as not valid because its length (\(textInput.count) symbol(s)) greater than required maximum lenght (\(maximumLength).")
    }
    
    func testTextInputLengthEqualToMaximumLength() {
        let maximumLength: UInt = 10
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let textInput = "abcdefghij"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as valid because its length (\(textInput.count) symbol(s)) equal to required maximum lenght (\(maximumLength).")
    }
    
    func testTextInputLengthLessThanMaximumLength() {
        let maximumLength: UInt = 10
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let textInput = "abcdefghi"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as valid because its length (\(textInput.count) symbol(s)) less than required maximum lenght (\(maximumLength).")
    }
    
    func testTextInputEmpty() {
        let maximumLength: UInt = 10
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Empty text input \"\(textInput)\" has to be recognized as valid because empty text input length (0 symbols) less than or equal to required maximum lenght (\(maximumLength).")
    }
    
    func testTextInputNil() {
        let maximumLength: UInt = 10
        let textInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let textInput: String? = nil
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Nil text input \"\(String(describing: textInput))\" has to be recognized as valid because nil text input is always valid.")
    }

}
