//
//  AUITextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/9/19.
//

import Foundation

public protocol AUITextFieldView {
  var textField: UITextField { get }
}

public protocol AUITextFieldViewController: AUITextFieldController {
  var textFieldView: (UIView & AUITextFieldView)? { get set }
}
