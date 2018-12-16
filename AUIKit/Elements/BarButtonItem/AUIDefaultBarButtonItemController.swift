//
//  AUIDefaultBarButtonItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/8/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

open class AUIDefaultBarButtonItemController: AUIDefaultBarItemController, AUIBarButtonItemController {
 
  // MARK: Delegates
  
  open weak var didSelectDelegate: AUIBarButtonItemControllerDidSelectDelegate?
  
  // MARK: View
  
  open var barButtonItem: UIBarButtonItem? {
    set { barItem = newValue }
    get { return barItem as? UIBarButtonItem }
  }
  
  open override func setupBarItem() {
    barButtonItem?.target = self
    barButtonItem?.action = #selector(didSelectAction)
  }
  
  open override func unsetupBarItem() {
    barButtonItem?.target = nil
    barButtonItem?.action = nil
  }
  
  // MARK: - Events -
  
  @objc private func didSelectAction() {
    didSelectDelegate?.barButtonItemControllerDidSelect(self)
  }
  
}
