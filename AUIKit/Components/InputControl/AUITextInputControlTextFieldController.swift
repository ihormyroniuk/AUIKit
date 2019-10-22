//
//  AUITextInputControlTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/7/19.
//

import Foundation

public protocol AUITextInputControlTextFieldController: AUITextFieldController {
  var textInputControl: AUITextInputControl? { get set }
}
