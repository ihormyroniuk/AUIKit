//
//  AUITextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/15/19.
//

import UIKit

public protocol AUITextViewControllerDidChangeTextDelegate: class {
  func textViewControllerDidChangeText(_ textFieldController: AUITextViewController)
}

public protocol AUITextViewControllerDidBeginEditingDelegate: class {
  func textViewControllerDidBeginEditing(_ textViewController: AUITextViewController)
}

public protocol AUITextViewControllerDidEndEditingDelegate: class {
  func textViewControllerDidEndEditing(_ textViewController: AUITextViewController)
}

public protocol AUITextViewController: AUIScrollViewController {
  
  // MARK: Delegates
  
  var didChangeTextDelegate: AUITextViewControllerDidChangeTextDelegate? { get set }
  var didBeginEditingDelegate: AUITextViewControllerDidBeginEditingDelegate? { get set }
  var didEndEditingDelegate: AUITextViewControllerDidEndEditingDelegate? { get set }
  
  // MARK: Text Field
  
  var textView: UITextView? { get set }
  
  var text: String! { get set }
  
  var keyboardType: UIKeyboardType { get set }
  var returnKeyType: UIReturnKeyType { get set }
  var autocorrectionType: UITextAutocorrectionType { get set }
  var autocapitalizationType: UITextAutocapitalizationType { get set }
  var isSecureTextEntry: Bool { get set }
  
  // MARK: Input Accessory View Controller
  
  var inputAccessoryViewController: AUIViewController? { get set }
  
  // MARK: Input View Controller
  
  var inputViewController: AUIViewController? { get set }
  
}
