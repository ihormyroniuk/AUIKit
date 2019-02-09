//
//  AUITextFieldController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITextFieldControllerDidChangeTextDelegate: class {
  func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController)
}

public protocol AUITextFieldControllerDidTapReturnKeyDelegate: class {
  func textFieldControllerDidTapReturnKey(_ textFieldController: AUITextFieldController)
}

public protocol AUITextFieldControllerDidBeginEditingDelegate: class {
  func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController)
}

public protocol AUITextFieldControllerDidEndEditingDelegate: class {
  func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController)
}

public protocol AUITextFieldControllerDidEndEditingReasonDelegate: class {
  func textFieldControllerDidEndEditingReason(_ textFieldController: AUITextFieldController, reason: UITextField.DidEndEditingReason)
}

public protocol AUITextFieldController: AUIControlController {
  
  // MARK: Delegates
  
  var didChangeTextDelegate: AUITextFieldControllerDidChangeTextDelegate? { get set }
  var didTapReturnKeyDelegate: AUITextFieldControllerDidTapReturnKeyDelegate? { get set }
  var didBeginEditingDelegate: AUITextFieldControllerDidBeginEditingDelegate? { get set }
  var didEndEditingDelegate: AUITextFieldControllerDidEndEditingDelegate? { get set }
  var didEndEditingReasonDelegate: AUITextFieldControllerDidEndEditingReasonDelegate? { get set }
  
  // MARK: Text Field
  
  var textField: UITextField? { get set }
  
  var text: String? { get set }
  var placeholder: String? { get set }
  var keyboardType: UIKeyboardType { get set }
  var isSecureTextEntry: Bool { get set }
  var autocorrectionType: UITextAutocorrectionType { get set }
  var autocapitalizationType: UITextAutocapitalizationType { get set }
  var returnKeyType: UIReturnKeyType { get set }
  
}
