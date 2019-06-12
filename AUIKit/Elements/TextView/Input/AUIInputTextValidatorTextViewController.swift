//
//  AUIInputTextValidatorTextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/5/19.
//

import Foundation

public protocol AUIInputTextValidatorTextViewController: AUITextViewController {
  var inputTextValidator: AUITextInputValidator? { get set }
}
