//
//  AUIResponsiveSubtextInputView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/16/19.
//

import UIKit

public protocol AUIResponsiveTextInputView: AUITextFieldTextInputView {
  func responsiveTextInputViewDidBeginEditingEmpty(animated: Bool)
  func responsiveTextInputViewDidBeginEditingNonempty(animated: Bool)
  func responsiveTextInputViewDidBecomeEmpty(animated: Bool)
  func responsiveTextInputViewDidBecomeNonEmpty(animated: Bool)
  func responsiveTextInputViewDidEndEditingEmpty(animated: Bool)
  func responsiveTextInputViewDidEndEditingNonempty(animated: Bool)
}
