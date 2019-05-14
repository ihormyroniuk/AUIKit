//
//  AUIFormattingTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

public protocol AUIFormattingTextFieldController: AUITextFieldController {
  
  // MARK: Unformatted Text
  
  var unformattedText: String? { get }
  
  // MARK: Inputted Text Formatter
  
  var inputtedTextFormatter: AUIInputtedTextFormatter? { get set }
  
}
