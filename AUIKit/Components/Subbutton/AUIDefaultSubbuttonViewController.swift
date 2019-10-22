//
//  AUIDefaultSubbuttonViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/10/19.
//

import Foundation

open class AUIDefaultSubbuttonViewController: AUIDefaultSubcontrolViewController, AUISubbuttonViewController {
  
  // MARK: SubbuttonController
  
  open var subbuttonController: AUIButtonController? {
    set {
      subcontrolController = newValue
    }
    get {
      return subcontrolController as? AUIButtonController
    }
  }
  
  open override func setupSubcontrolController() {
    super.setupSubcontrolController()
    setupSubbuttonController()
  }
  
  open func setupSubbuttonController() {
    
  }
  
  open override func unsetupSubcontrolController() {
    super.unsetupSubcontrolController()
    unsetupSubbuttonController()
  }
  
  open func unsetupSubbuttonController() {
    
  }
  
}
