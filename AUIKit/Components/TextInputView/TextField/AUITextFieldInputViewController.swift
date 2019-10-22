//
//  AUISubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUITextFieldInputViewController: AUIViewController {

    // MARK: TextFieldInputView
    
    var textFieldInputView: AUITextFieldInputView? { get set }
    
    // MARK: TextFieldController
  
    var textFieldController: AUITextFieldController? { get set }
  
}
