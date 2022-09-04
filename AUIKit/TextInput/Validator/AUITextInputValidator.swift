import Foundation

public protocol AUITextInputValidator {
    func validate(textInput: String?) -> Bool
}
