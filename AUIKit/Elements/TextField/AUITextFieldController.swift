//
//  AUITextFieldController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITextFieldControllerDidChangeTextObserver: class {
  func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController)
}

public protocol AUITextFieldControllerDidTapReturnKeyObserver: class {
  func textFieldControllerDidTapReturnKey(_ textFieldController: AUITextFieldController)
}

public protocol AUITextFieldControllerDidBeginEditingObserver: class {
  func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController)
}

public protocol AUITextFieldControllerDidEndEditingObserver: class {
  func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController)
}

public protocol AUITextFieldControllerDidEndEditingReasonObserver: class {
  func textFieldControllerDidEndEditingReason(_ textFieldController: AUITextFieldController, reason: UITextField.DidEndEditingReason)
}

public protocol AUITextFieldController: AUIControlController {
  
  // MARK: Observers
  
  func addDidChangeTextObserver(_ observer: AUITextFieldControllerDidChangeTextObserver)
  func removeDidChangeTextObserver(_ observer: AUITextFieldControllerDidChangeTextObserver)

  func addDidTapReturnKeyObserver(_ observer: AUITextFieldControllerDidTapReturnKeyObserver)
  func removeDidTapReturnKeyObserver(_ observer: AUITextFieldControllerDidTapReturnKeyObserver)
  
  func addDidBeginEditingObserver(_ observer: AUITextFieldControllerDidBeginEditingObserver)
  func removeDidBeginEditingObserver(_ observer: AUITextFieldControllerDidBeginEditingObserver)
  
  func addDidEndEditingObserver(_ observer: AUITextFieldControllerDidEndEditingObserver)
  func removeDidEndEditingObserver(_ observer: AUITextFieldControllerDidEndEditingObserver)
  
  func addDidEndEditingReasonObserver(_ observer: AUITextFieldControllerDidEndEditingReasonObserver)
  func removeDidEndEditingReasonObserver(_ observer: AUITextFieldControllerDidEndEditingReasonObserver)
  
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
