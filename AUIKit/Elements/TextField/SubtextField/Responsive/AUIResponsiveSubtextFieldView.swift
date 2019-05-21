//
//  AUIResponsiveSubtextFieldView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/16/19.
//

import UIKit

public protocol AUIResponsiveSubtextFieldView {
  func responsiveSubtextFieldDidBeginEditingEmpty(animated: Bool)
  func responsiveSubtextFieldDidBeginEditingNonempty(animated: Bool)
  func responsiveSubtextFieldDidEndEditingEmpty(animated: Bool)
  func responsiveSubtextFieldDidEndEditingNonempty(animated: Bool)
}
