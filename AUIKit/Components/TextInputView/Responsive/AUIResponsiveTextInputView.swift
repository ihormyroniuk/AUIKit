//
//  AUIResponsiveSubtextInputView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/16/19.
//

import UIKit

public protocol AUIResponsiveTextInputView: AUITextFieldInputView {
  func responsiveSubtextInputViewDidBeginEditingEmpty(animated: Bool)
  func responsiveSubtextInputViewDidBeginEditingNonempty(animated: Bool)
  func responsiveSubtextInputViewDidBecomeEmpty(animated: Bool)
  func responsiveSubtextInputViewDidBecomeNonEmpty(animated: Bool)
  func responsiveSubtextInputViewDidEndEditingEmpty(animated: Bool)
  func responsiveSubtextInputViewDidEndEditingNonempty(animated: Bool)
}
