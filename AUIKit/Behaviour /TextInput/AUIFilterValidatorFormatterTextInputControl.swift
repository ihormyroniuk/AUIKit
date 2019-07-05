//
//  AUIFilterValidatorFormatterTextInputControl.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/7/19.
//

import Foundation

open class AUIFilterValidatorFormatterTextInputControl: AUITextInputControl {
  
  open var textInputFilter: AUITextInputFilter?
  open var textInputValidator: AUITextInputValidator?
  open var textInputFormatter: AUITextInputFormatter?
  
  public init() {
    
  }
  
  public func clearText(_ text: String?) -> String? {
    return textInputFormatter?.unformat(formattedText: text) ?? text
  }
  
  open func processTextInput(currentDisplayedText: String?, range: NSRange, replacementText text: String?) -> AUITextInputControlProcessedResult {
    var filteredString = text ?? ""
    if let inputTextFilter = textInputFilter {
      filteredString = inputTextFilter.filter(text: text) ?? ""
    }
    guard let inputtedTextFormatter = textInputFormatter else {
      guard let textRange = Range(range, in: currentDisplayedText ?? "") else { return (displayedText: currentDisplayedText, caretPosition: currentDisplayedText?.count ?? 0) }
      let newText = (currentDisplayedText ?? "").replacingCharacters(in: textRange, with: filteredString)
      guard textInputValidator?.isValidInputtingText(currentText: currentDisplayedText, newText: newText) == false else {
        return (displayedText: newText, caretPosition: range.location + filteredString.count  + (text?.isEmpty == false ? 0 : range.length))
      }
        return (displayedText: currentDisplayedText, caretPosition: range.location)
    }
    let formattingResult = inputtedTextFormatter.formatInputtedText(currentText: currentDisplayedText, range: range, replacementString: filteredString)
    let currentUnformattedText = inputtedTextFormatter.unformat(formattedText: currentDisplayedText)
    let newUnformattedText = inputtedTextFormatter.unformat(formattedText: formattingResult.formattedText)
    guard textInputValidator?.isValidInputtingText(currentText: currentUnformattedText, newText: newUnformattedText) == false else {
      return (displayedText: formattingResult.formattedText, caretPosition: formattingResult.caretBeginOffset)
    }
    return (displayedText: currentDisplayedText, caretPosition: range.location + filteredString.count + (text?.isEmpty == false ? 0 : range.length))
  }
  
}
