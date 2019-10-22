//
//  AUISubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

public protocol AUITextViewInputViewController: AUIViewController {

    // MARK: TextFieldInputView
    
    var textViewInputView: AUITextViewInputView? { get set }
    
    // MARK: Subview
  
    var textViewController: AUITextViewController? { get set }
  
}
