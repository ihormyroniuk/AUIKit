//
//  AUITextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/15/19.
//

import UIKit

public protocol AUITextViewController: AUIScrollViewController {
  
    // MARK: Observers
  
    var didChangeText: (() -> Void)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }
  
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
