//
//  AUIDefaultSubviewSubviewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 7/30/19.
//

import UIKit

open class AUIDefaultSubviewSubviewViewController: AUIDefaultViewController, AUISubviewSubviewViewController {
  
  // MARK: Subview Controllers
  
  private var _subviewController1: AUIViewController?
  open var subviewController1: AUIViewController? {
    set {
      if newValue !== _subviewController1 {
        unsetupSubviewController1()
        _subviewController1 = newValue
        setupSubviewController1()
      }
    }
    get {
      return _subviewController1
    }
  }
  
  open func setupSubviewController1() {
    subviewController1?.view = subviewSubviewView?.subview1
  }
  
  open func unsetupSubviewController1() {
    subviewController1?.view = nil
  }
  
  private var _subviewController2: AUIViewController?
  open var subviewController2: AUIViewController? {
    set {
      if newValue !== _subviewController2 {
        unsetupSubviewController2()
        _subviewController2 = newValue
        setupSubviewController2()
      }
    }
    get {
      return _subviewController2
    }
  }
  
  open func setupSubviewController2() {
    subviewController2?.view = subviewSubviewView?.subview2
  }
  
  open func unsetupSubviewController2() {
    subviewController2?.view = nil
  }
  
  // MARK: Subview
  
  open var subviewSubviewView: (UIView & AUISubviewSubviewView)? {
    set {
      view = newValue
    }
    get {
      return view as? (UIView & AUISubviewSubviewView)
    }
  }
  
  open override func setupView() {
    super.setupView()
    subviewController1?.view = subviewSubviewView?.subview1
    subviewController2?.view = subviewSubviewView?.subview2
  }
  
  open override func unsetupView() {
    super.unsetupView()
    subviewController1?.view = nil
    subviewController2?.view = nil
  }
  
}
