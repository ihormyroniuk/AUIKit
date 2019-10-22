//
//  AUITextFieldInputView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 10/22/19.
//

import UIKit

public protocol AUITextFieldTextInputView where Self: UIView {
    var textField: UITextField { get }
}
