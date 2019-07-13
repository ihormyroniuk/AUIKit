//
//  AUIResponsiveSubtextFieldView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/16/19.
//

import UIKit

public protocol AUIResponsiveSubtextFieldView {
  func responsiveSubtextFieldViewDidBeginEditingEmpty(animated: Bool)
  func responsiveSubtextFieldViewDidBeginEditingNonempty(animated: Bool)
  func responsiveSubtextFieldViewDidBecomeEmpty(animated: Bool)
  func responsiveSubtextFieldViewDidBecomeNonEmpty(animated: Bool)
  func responsiveSubtextFieldViewDidEndEditingEmpty(animated: Bool)
  func responsiveSubtextFieldViewDidEndEditingNonempty(animated: Bool)
}
