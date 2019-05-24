//
//  AUIValidateableTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

public protocol AUIValidatingTextFieldController: AUITextFieldController {
  
  // MARK: Inputted Text Validator
  
  var inputtedTextValidator: AUIInputtingTextValidator? { get set }
  
}
