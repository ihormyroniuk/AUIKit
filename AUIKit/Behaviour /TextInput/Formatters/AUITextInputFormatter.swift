//
//  AUIInputtedTextFormatter.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

public typealias AUIInputtedTextFormatterResult = (formattedText: String?, caretBeginOffset: Int)

public protocol AUITextInputFormatter {
  func format(text: String?) -> String?
  func unformat(formattedText: String?) -> String?
  func formatInputtedText(currentText: String?, range: NSRange, replacementString text: String?) -> AUIInputtedTextFormatterResult
}
