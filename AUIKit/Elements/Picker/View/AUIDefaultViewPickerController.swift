//
//  AUIDefaultViewPickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import UIKit

open class AUIDefaultViewPickerController: AUIDefaultPickerController, AUIViewPickerController, UIPickerViewDelegateProxyDelegate {
  
  // MARK: Delegates
  
  private let pickerViewDelegateProxy = UIPickerViewDelegateProxy()
  
  // MARK: Component Controllers
  
  open var viewComponentControllers: [AUIViewPickerComponentController] = [] {
    didSet {
      didSetViewComponentControllers(oldValue)
    }
  }
  func didSetViewComponentControllers(_ oldValue: [AUIViewPickerComponentController]) {
    pickerView?.reloadAllComponents()
  }
  
  open override var componentControllers: [AUIPickerComponentController] {
    return viewComponentControllers
  }
  
  // MARK: Setup
  
  open override func setup() {
    super.setup()
    pickerViewDelegateProxy.delegate = self
  }
  
  // MARK: UIPickerView
  
  open override func setupView() {
    super.setupView()
    pickerView?.delegate = pickerViewDelegateProxy
    pickerView?.reloadAllComponents()
  }
  
  open override func unsetupView() {
    super.unsetupView()
    pickerView?.delegate = nil
  }
  
  // MARK: UIPickerViewDelegateProxyDelegate
  
  func viewForItem(_ item: Int, inComponent component: Int, reusingView view: UIView?) -> UIView {
    return viewComponentControllers[component].viewItemControllers[item].view
  }
  
  open func didSelectItem(_ item: Int, inComponent component: Int) {
    guard componentControllers.count < component else { return }
    let componentController = componentControllers[component]
    guard componentController.itemControllers.count < item else { return }
    let itemController = componentController.itemControllers[item]
    for object in didSelectItemControllerObservers.allObjects {
      guard let observer = object as? AUIPickerControllerDidSelectItemControllerObserver else { continue }
      observer.pickerController(self, didSelectItemController: itemController, atComponentController: componentController)
    }
  }
}

private protocol  UIPickerViewDelegateProxyDelegate: class {
  func viewForItem(_ item: Int, inComponent component: Int, reusingView view: UIView?) -> UIView
  func didSelectItem(_ item: Int, inComponent component: Int)
}

private class UIPickerViewDelegateProxy: NSObject, UIPickerViewDelegate {
  weak var delegate: UIPickerViewDelegateProxyDelegate?
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    return delegate?.viewForItem(row, inComponent: component, reusingView: view) ?? UIView()
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    delegate?.didSelectItem(row, inComponent: component)
  }
}
