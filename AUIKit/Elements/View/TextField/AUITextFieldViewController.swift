//
//  AUITextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/9/19.
//

import UIKit

public protocol AUITextFieldView {
  var textField: UITextField { get }
  func editingNotEmpty()
  func editingEmpty()
  func notEditingNotEmpty()
  func notEditingEmpty()
}

public protocol AUITextFieldViewController: AUITextFieldController {
  
  // MARK: TextFieldView
  
  var textFieldView: (UIView & AUITextFieldView)? { get set }
  
}
