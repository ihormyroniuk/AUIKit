import Foundation

open class AUIAllowedCharactersTextInputValidator: AUITextInputValidator {

    // MARK: Text Input Validators

    private let allowedCharacters: CharacterSet

    // MARK: Initializer

    public init(allowedCharacters: CharacterSet) {
        self.allowedCharacters = allowedCharacters
    }

    // MARK: AUITextInputValidator

    open func validate(textInput: String?) -> Bool {
        guard let inputtedText = textInput else { return true }
        let inputtedCharacterSet = CharacterSet(charactersIn: inputtedText)
        let isValid = inputtedCharacterSet.isSubset(of: allowedCharacters)
        return isValid
    }

}
