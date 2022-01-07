//
//  AUIDefaultInputTextFilterValidatorFormatterTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 9/14/19.
//

import Foundation

open class AUITextInputFilterValidatorFormatterTextFieldController: AUIEmptyTextFieldController {
  
    // MARK: AUIValidatingFormattingTextFieldController
  
    private var formattedText: String? {
        didSet {
            didSetFormattedText(oldValue: oldValue)
        }
    }
    private func didSetFormattedText(oldValue: String?) {
        if oldValue != formattedText {
            textField?.text = formattedText
            for object in didChangeTextObservers.allObjects {
                guard let observer = object as? AUITextFieldControllerDidChangeTextObserver else { continue }
                observer.textFieldControllerDidChangeText(self)
            }
        }
    }
    open override var text: String? {
        set {
            var filteredNewValue = newValue
            if let inputTextFilter = inputTextFilter {
                filteredNewValue = inputTextFilter.filter(textInput: newValue) ?? ""
            }
            guard (textInputValidator?.validate(textInput: "") ?? true) else { return }
            if let inputtedTextFormatter = inputTextFormatter {
                guard formattedText != filteredNewValue else { return }
                formattedText = inputtedTextFormatter.format(text: filteredNewValue)
            } else {
                formattedText = filteredNewValue
            }
        }
        get {
            if let inputtedTextFormatter = inputTextFormatter {
                return inputtedTextFormatter.unformat(formattedText: formattedText)
            } else {
                return formattedText
            }
        }
    }
    override open func didSetText(oldValue: String?) {
    
    }
  
    // MARK: AUIInputTextFilterTextFieldController
  
    open var inputTextFilter: AUITextInputFilter? {
        didSet { didSetInputTextFilter(oldValue) }
    }
    open func didSetInputTextFilter(_ oldValue: AUITextInputFilter?) {
        if let inputTextFilter = inputTextFilter {
            text = inputTextFilter.filter(textInput: text)
        }
    }
  
    // MARK: AUIInputTextValidatorTextFieldController
  
    open var textInputValidator: AUITextInputValidator? {
        didSet { didSetInputtedTextValidator(oldValue) }
    }
    open func didSetInputtedTextValidator(_ oldValue: AUITextInputValidator?) {
        if !(textInputValidator?.validate(textInput: text) ?? true) {
            text = nil
        }
    }
  
    // MARK: AUIInputTextFormatterTextFieldController
  
    open var inputTextFormatter: AUITextInputFormatter? {
        didSet { didSetInputtedTextFormatter(oldValue) }
    }
    open func didSetInputtedTextFormatter(_ oldValue: AUITextInputFormatter?) {
        var oldUnformattedText = text
        if let oldValue = oldValue {
            oldUnformattedText = oldValue.unformat(formattedText: text)
        }
        text = inputTextFormatter?.format(text: oldUnformattedText)
    }
  
    // MARK: UITextFieldDelegate
  
    open override func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var filteredString = string
        if let inputTextFilter = inputTextFilter {
            filteredString = inputTextFilter.filter(textInput: text) ?? ""
        }
        guard let inputtedTextFormatter = inputTextFormatter else {
            guard let textRange = Range(range, in: text ?? "") else { return true }
            let newText = (formattedText ?? "").replacingCharacters(in: textRange, with: filteredString)
            return textInputValidator?.validate(textInput: newText) ?? true
        }
        let formattingResult = inputtedTextFormatter.formatTextInput(currentText: formattedText, range: range, replacementText: filteredString)
        let newUnformattedText = inputtedTextFormatter.unformat(formattedText: formattingResult.formattedText)
        guard (textInputValidator?.validate(textInput: newUnformattedText) ?? true) else { return false }
        formattedText = formattingResult.formattedText
        if let textField = textField, let cursorLocation = textField.position(from: textField.beginningOfDocument, offset: formattingResult.caretBeginOffset) {
            DispatchQueue.main.async { textField.selectedTextRange = textField.textRange(from: cursorLocation, to: cursorLocation) }
        }
        return false
    }
  
}
