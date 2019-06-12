//
//  AUIInputTextFilterTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/4/19.
//

import Foundation

public protocol AUIInputTextFilterTextFieldController: AUITextFieldController {
  var inputTextFilter: AUITextInputFilter? { get set }
}
