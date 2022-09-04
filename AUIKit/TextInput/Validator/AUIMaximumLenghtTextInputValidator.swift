import Foundation

open class AUIMaximumLenghtTextInputValidator: AUITextInputValidator {

    // MARK: Text Input Validators

    private let maximumLength: UInt

    // MARK: Initializer

    public init(maximumLength: UInt) {
        self.maximumLength = maximumLength
    }

    // MARK: AUITextInputValidator

    open func validate(textInput: String?) -> Bool {
        guard let inputtedText = textInput else { return true }
        let isValid = inputtedText.count <= maximumLength
        return isValid
    }

}
