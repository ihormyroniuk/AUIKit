//
//  AUITextFieldController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITextFieldController: AUIControlController {
  
    // MARK: Observers
  
    var didChangeText: (() -> Void)? { get set }

    var didTapReturnKey: (() -> Bool)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }
    
    var didEndEditingReason: ((UITextField.DidEndEditingReason) -> Void)? { get set }

    // MARK: State
  
    var text: String? { get set }
    var placeholder: String? { get set }
    var keyboardType: UIKeyboardType { get set }
    var isSecureTextEntry: Bool { get set }
    var autocorrectionType: UITextAutocorrectionType { get set }
    var autocapitalizationType: UITextAutocapitalizationType { get set }
    var returnKeyType: UIReturnKeyType { get set }
    var shouldBeginEditing: Bool { get set }
    var shouldEndEditing: Bool { get set }
  
    // MARK: Input Accessory View Controller
  
    var inputAccessoryViewController: AUIViewController? { get set }
  
    // MARK: Input View Controller
  
    var inputViewController: AUIViewController? { get set }
  
    // MARK: TextField
  
    var textField: UITextField? { get set }
  
}
