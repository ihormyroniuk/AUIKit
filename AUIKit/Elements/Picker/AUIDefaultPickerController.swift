//
//  AUIDefaultPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultPickerController: AUIDefaultViewController, AUIPickerController, UIPickerViewDataSourceProxyDelegate {

  // MARK: Delegates
  
  private let pickerViewDataSourceProxy = UIPickerViewDataSourceProxy()
  
  // MAKR: Setup
  
  open override func setup() {
    super.setup()
    pickerViewDataSourceProxy.delegate = self
  }
  
  // MARK: View
  
  open var pickerView: UIPickerView? {
    set { view = newValue }
    get { return view as? UIPickerView }
  }
  
  open override func setupView() {
    super.setupView()
    pickerView?.dataSource = pickerViewDataSourceProxy
  }
  
  open override func unsetupView() {
    super.unsetupView()
    pickerView?.dataSource = nil
  }
  
  // MARK: UIPickerViewDataSourceProxyDelegate
  
  open func numberOfComponents() -> Int {
    return 0
  }
  
  open func numberOfItemsInComponent(_ component: Int) -> Int {
    return 0
  }
  
  // MARK: Select
  
  open func select(_ itemController: AUIPickerItemController, animated: Bool) {
    
  }
}

private protocol  UIPickerViewDataSourceProxyDelegate: class {
  func numberOfComponents() -> Int
  func numberOfItemsInComponent(_ component: Int) -> Int
}

private class UIPickerViewDataSourceProxy: NSObject, UIPickerViewDataSource {
  weak var delegate: UIPickerViewDataSourceProxyDelegate?
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return delegate?.numberOfComponents() ?? 0
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return delegate?.numberOfItemsInComponent(component) ?? 0
  }
}
