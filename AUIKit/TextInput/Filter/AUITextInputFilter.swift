import Foundation

public protocol AUITextInputFilter {
    func filter(textInput: String?) -> String?
}
