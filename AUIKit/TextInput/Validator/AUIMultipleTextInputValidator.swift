import Foundation

open class AUIMultipleTextInputValidator: AUITextInputValidator {

    // MARK: Text Input Validators

    private let textInputValidators: [AUITextInputValidator]

    // MARK: Initializer

    public init(textInputValidators: [AUITextInputValidator]) {
        self.textInputValidators = textInputValidators
    }

    // MARK: AUITextInputValidator

    open func validate(textInput: String?) -> Bool {
        for textInputValidator in textInputValidators {
            if !textInputValidator.validate(textInput: textInput) {
                return false
            }
        }
        return true
    }

}
