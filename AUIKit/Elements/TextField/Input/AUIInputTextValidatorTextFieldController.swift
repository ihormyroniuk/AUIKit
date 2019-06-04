//
//  AUIInputValidatorTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/4/19.
//

import Foundation

public protocol AUIInputTextValidatorTextFieldController: AUITextFieldController {
  var inputTextValidator: AUIInputTextValidator? { get set }
}
