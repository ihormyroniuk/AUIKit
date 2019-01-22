//
//  AUITextViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUITextViewController: AUIScrollViewController {
 
  var textView: UITextView? { get set }
  
  var didChangeTextDelegate: AUITextViewControllerDidChangeTextDelegate? { get set }
  var didBeginEditingDelegate: AUITextViewControllerDidBeginEditingDelegate? { get set }
  var didEndEditingDelegate: AUITextViewControllerDidEndEditingDelegate? { get set }
  var shouldChangeTextDelegate: AUITextViewControllerSholdChangeTextDelegate? { get set }
  
  var text: String? { get set }
  var keyboardType: UIKeyboardType { get set }
  var autocorrectionType: UITextAutocorrectionType { get set }
  var autocapitalizationType: UITextAutocapitalizationType { get set }
  
}

public protocol AUITextViewControllerDidChangeTextDelegate: class {
  func textViewControllerDidChangeText(_ controller: AUITextViewController)
}

public protocol AUITextViewControllerDidBeginEditingDelegate: class {
  func textViewControllerDidBeginEditing(_ controller: AUITextViewController)
}

public protocol AUITextViewControllerDidEndEditingDelegate: class {
  func textViewControllerDidEndEditing(_ controller: AUITextViewController)
}

public protocol AUITextViewControllerSholdChangeTextDelegate: class {
  func textViewControllerShouldChangeText(in controller: AUITextViewController, at range: NSRange, replacementString string: String) -> Bool
}
