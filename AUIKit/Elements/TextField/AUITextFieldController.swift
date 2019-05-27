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
  
  func addDidChangeTextObserver(_ observer: AUITextFieldControllerDidChangeTextDelegate)
  func removeDidChangeTextObserver(_ observer: AUITextFieldControllerDidChangeTextDelegate)

  func addDidTapReturnKeyObserver(_ observer: AUITextFieldControllerDidTapReturnKeyDelegate)
  func removeDidTapReturnKeyObserver(_ observer: AUITextFieldControllerDidTapReturnKeyDelegate)
  
  func addDidBeginEditingObserver(_ observer: AUITextFieldControllerDidBeginEditingDelegate)
  func removeDidBeginEditingObserver(_ observer: AUITextFieldControllerDidBeginEditingDelegate)
  
  func addDidEndEditingObserver(_ observer: AUITextFieldControllerDidEndEditingDelegate)
  func removeDidEndEditingObserver(_ observer: AUITextFieldControllerDidEndEditingDelegate)
  
  func addDidEndEditingReasonObserver(_ observer: AUITextFieldControllerDidEndEditingReasonDelegate)
  func removeDidEndEditingReasonObserver(_ observer: AUITextFieldControllerDidEndEditingReasonDelegate)
  
  // MARK: 
  
  var text: String? { get set }
  var placeholder: String? { get set }
  var keyboardType: UIKeyboardType { get set }
  var isSecureTextEntry: Bool { get set }
  var autocorrectionType: UITextAutocorrectionType { get set }
  var autocapitalizationType: UITextAutocapitalizationType { get set }
  var returnKeyType: UIReturnKeyType { get set }
  
  // MARK: Input Accessory View Controller
  
  var inputAccessoryViewController: AUIViewController? { get set }
  
  // MARK: Input View Controller
  
  var inputViewController: AUIViewController? { get set }
  
  // MARK: TextField
  
  var textField: UITextField? { get set }
  
}
