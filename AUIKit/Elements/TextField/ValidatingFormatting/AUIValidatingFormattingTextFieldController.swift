//
//  AUIValidatingFormattingTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

public protocol AUIValidatingFormattingTextFieldController: AUITextFieldController {
  
  var inputtedTextFormatter: AUIInputtedTextFormatter? { get set }
  
  var inputtedTextValidator: AUIInputtingTextValidator? { get set }
  
}
