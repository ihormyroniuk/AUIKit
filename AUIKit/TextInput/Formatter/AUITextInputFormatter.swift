import Foundation

public typealias AUITextInputFormatResult = (formattedText: String?, caretBeginOffset: Int)

public protocol AUITextInputFormatter {
    func format(text: String?) -> String?
    func unformat(formattedText: String?) -> String?
    func formatTextInput(currentText: String?, range: NSRange, replacementText text: String?) -> AUITextInputFormatResult
}
