//
//  AUIDefaultBarButtonItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/8/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

open class AUIDefaultBarButtonItemController: AUIDefaultBarItemController, AUIBarButtonItemController {
 
  // MARK: Observers
  
  open var didSelectObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidSelectObserver(_ observer: AUIBarButtonItemControllerDidSelectObserver) {
    didSelectObservers.add(observer)
  }
  
  open func removeDidSelectObserver(_ observer: AUIBarButtonItemControllerDidSelectObserver) {
    didSelectObservers.remove(observer)
  }
  
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
  
  // MARK: Events
  
  @objc open func didSelectAction() {
    for object in didSelectObservers.allObjects {
      guard let observer = object as? AUIBarButtonItemControllerDidSelectObserver else { continue }
      observer.barButtonItemControllerDidSelect(self)
    }
  }
  
}
