//
//  AUISubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

public protocol AUISubtextViewViewController: AUISubcontrolViewController {
  
  // MARK: Delegates
  
  var subtextViewControllerDidChangeTextDelegate: AUITextViewControllerDidChangeTextObserver? { get set }
  var subtextViewControllerDidBeginEditingDelegate: AUITextViewControllerDidBeginEditingObserver? { get set }
  var subtextViewControllerDidEndEditingDelegate: AUITextViewControllerDidEndEditingObserver? { get set }
  
  // MARK: Subview
  
  var subtextViewController: AUITextViewController? { get set }
  
}
