//
//  AUIResponsiveSubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 8/2/19.
//

import Foundation

public protocol AUIResponsiveSubtextViewViewController: AUISubtextViewViewController {
  
  // MARK: ResponsiveSubtextFieldView
  
  var responsiveSubtextInputView: AUIResponsiveSubtextInputView? { get set }
  
}
