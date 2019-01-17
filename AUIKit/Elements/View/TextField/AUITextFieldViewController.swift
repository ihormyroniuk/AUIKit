//
//  AUITextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/9/19.
//

import UIKit

public protocol AUITextFieldView {
  var textField: UITextField { get }
  
  func editingEmpty()
  func notEditingEmpty()
  func editingNotEmpty()
  func notEditingNotEmpty()
}

public protocol AUITextFieldViewController: AUITextFieldController {
  
  // MARK: TextFieldView
  
  var textFieldView: (UIView & AUITextFieldView)? { get set }
  
}
