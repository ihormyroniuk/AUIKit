//
//  AUISubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

public protocol AUISubtextViewViewController: AUISubcontrolViewController {
  
  // MARK: Delegates
  
  var subtextViewControllerDidChangeTextDelegate: AUITextViewControllerDidChangeTextDelegate? { get set }
  var subtextViewControllerDidBeginEditingDelegate: AUITextViewControllerDidBeginEditingDelegate? { get set }
  var subtextViewControllerDidEndEditingDelegate: AUITextViewControllerDidEndEditingDelegate? { get set }
  
  // MARK: Subview
  
  var subtextViewController: AUITextViewController? { get set }
  
}
