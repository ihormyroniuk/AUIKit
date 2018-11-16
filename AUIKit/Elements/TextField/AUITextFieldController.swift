//
//  AUITextFieldController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITextFieldControllerDidChangeTextDelegate: class {
  func textFieldControllerDidChangeText(_ controller: AUITextFieldController)
}

public protocol AUITextFieldControllerDidTapReturnKeyDelegate: class {
  func textFieldControllerDidTapReturnKey(_ controller: AUITextFieldController)
}

public protocol AUITextFieldController: AUIControlController {
  
  var textField: UITextField? { get set }
  
  var didChangeTextDelegate: AUITextFieldControllerDidChangeTextDelegate? { get set }
  var didTapReturnKeyDelegate: AUITextFieldControllerDidTapReturnKeyDelegate? { get set }
  
  var text: String? { get set }
  var placeholder: String? { get set }
  var keyboardType: UIKeyboardType { get set }
  var isSecureTextEntry: Bool { get set }
  var autocorrectionType: UITextAutocorrectionType { get set }
  var autocapitalizationType: UITextAutocapitalizationType { get set }
  var returnKeyType: UIReturnKeyType { get set }
  
}
