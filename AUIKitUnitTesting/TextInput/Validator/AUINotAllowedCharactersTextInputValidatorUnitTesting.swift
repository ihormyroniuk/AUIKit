import XCTest
import AUIKit

class AUINotAllowedCharactersTextInputValidatorUnitTesting: XCTestCase {

    func testTextInputWithOnlyAllowedCharacters() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = "jsgnjdsjfgjjdgf _----"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as valid because it does not contain not allowed symbols.")
    }
    
    func testTextInputWithOnlyNotAllowedCharacters() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = "13957378383131"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as not valid because it contains only not allowed symbols.")
    }
    
    func testTextInputWithSomeAllowedCharacters() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = "55jf3sg16njds2jfg2jj2dgf _33"
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = false
        XCTAssert(actualIsValid == expectedIsValid, "Text input \"\(textInput)\" has to be recognized as not valid because it contains some not allowed symbols.")
    }
    
    func testTextInputEmpty() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Empty text input \"\(textInput)\" has to be recognized as valid because it does not contain not allowed symbols and .")
    }
    
    func testTextInputNil() {
        let notAllowedCharacters = CharacterSet(charactersIn: "0123456789")
        let textInputValidator = AUINotAllowedCharactersTextInputValidator(notAllowedCharacters: notAllowedCharacters)
        let textInput = ""
        
        let actualIsValid = textInputValidator.validate(textInput: textInput)
        
        let expectedIsValid = true
        XCTAssert(actualIsValid == expectedIsValid, "Nil text input \"\(String(describing: textInput))\" has to be recognized as valid because nil text input is always valid.")
    }
    
}
