//
//  AUIInputTextController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/7/19.
//

import UIKit

public typealias AUITextInputControlProcessedResult = (displayedText: String?, caretPosition: Int)

public protocol AUITextInputControl {
  func clearText(_ text: String?) -> String?
  func processTextInput(currentDisplayedText: String?, range: NSRange, replacementText text: String?) -> AUITextInputControlProcessedResult
}
