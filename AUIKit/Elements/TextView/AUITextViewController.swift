//
//  AUITextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/15/19.
//

import UIKit

public protocol AUITextViewControllerDidChangeTextObserver: class {
  func textViewControllerDidChangeText(_ textFieldController: AUITextViewController)
}

public protocol AUITextViewControllerDidBeginEditingObserver: class {
  func textViewControllerDidBeginEditing(_ textViewController: AUITextViewController)
}

public protocol AUITextViewControllerDidEndEditingObserver: class {
  func textViewControllerDidEndEditing(_ textViewController: AUITextViewController)
}

public protocol AUITextViewController: AUIScrollViewController {
  
  // MARK: Observers
  
  func addDidChangeTextObserver(_ observer: AUITextViewControllerDidChangeTextObserver)
  func removeDidChangeTextObserver(_ observer: AUITextViewControllerDidChangeTextObserver)
  
  func addDidBeginEditingObserver(_ observer: AUITextViewControllerDidBeginEditingObserver)
  func removeDidBeginEditingObserver(_ observer: AUITextViewControllerDidBeginEditingObserver)
  
  func addDidEndEditingObserver(_ observer: AUITextViewControllerDidEndEditingObserver)
  func removeDidEndEditingObserver(_ observer: AUITextViewControllerDidEndEditingObserver)
  
  // MARK: Text Field
  
  var textView: UITextView? { get set }

  // MARK:
  
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
