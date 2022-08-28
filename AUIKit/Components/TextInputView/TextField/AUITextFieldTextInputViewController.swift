//
//  AUISubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUITextFieldTextInputViewController: AUIViewController {
    
    var didChangeText: (() -> Void)? { get set }

    var didTapReturnKey: (() -> Bool)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }
    
    var didEndEditingReason: ((UITextField.DidEndEditingReason) -> Void)? { get set }

    // MARK: TextFieldInputView
    
    var textFieldInputView: AUITextFieldTextInputView? { get set }
    
    // MARK: TextFieldController
  
    var textFieldController: AUITextFieldController? { get set }
  
}
