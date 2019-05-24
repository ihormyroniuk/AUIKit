//
//  AUIDefaultSubviewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import UIKit

open class AUIDefaultSubviewViewController: AUIDefaultViewController, AUISubviewViewController {
  
  // MARK: Subview Controller
  
  private var _subviewController: AUIViewController?
  open var subviewController: AUIViewController? {
    set {
      if newValue !== _subviewController {
        unsetupSubviewController()
        _subviewController = newValue
        setupSubviewController()
      }
    }
    get {
      return _subviewController
    }
  }
  
  open func setupSubviewController() {
    subviewController?.view = subviewView?.subview
  }
  
  open func unsetupSubviewController() {
    subviewController?.view = nil
  }
  
  // MARK: Subview
  
  open var subviewView: (UIView & AUISubviewView)? {
    set {
      view = newValue
    }
    get {
      return view as? (UIView & AUISubviewView)
    }
  }
  
  open override func setupView() {
    super.setupView()
    subviewController?.view = subviewView?.subview
  }
  
  open override func unsetupView() {
    super.unsetupView()
    subviewController?.view = nil
  }
  
}
