//
//  AUIValidatingFormattingTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

public protocol AUIInputTextFormatterTextFieldController: AUITextFieldController {
  var inputTextFormatter: AUIInputTextFormatter? { get set }
}
