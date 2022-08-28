//
//  AUISubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

public protocol AUITextViewInputTextViewController: AUIViewController {
    
    var didChangeText: (() -> Void)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }

    // MARK: TextFieldInputView
    
    var textViewInputView: AUITextViewTextInputView? { get set }
    
    // MARK: Subview
  
    var textViewController: AUITextViewController? { get set }
  
}
