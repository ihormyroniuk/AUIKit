//
//  AUIDefaultTitlePickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultTitlePickerController: AUIDefaultPickerController, AUITitlePickerController, UIPickerViewDelegateProxyDelegate {

  // MARK: Delegates
  
  private let pickerViewDelegateProxy = UIPickerViewDelegateProxy()
  
  public weak var didSelectDelegate: AUITitlePickerControllerDidSelectDelegate?
  
  // MARK: Controllers
  
  open var components: [AUITitlePickerComponentController] = []
  
  // MARK: Setup
  
  open override func setup() {
    super.setup()
    pickerViewDelegateProxy.delegate = self
  }
  
  // MARK: View
  
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
  
  open override func numberOfComponents() -> Int {
    return components.count
  }
  
  open override func numberOfItemsInComponent(_ component: Int) -> Int {
    return components[component].items.count
  }
  
  open func titleForItem(_ item: Int, inComponent component: Int) -> String? {
    return components[component].items[item].title
  }
  
  open func attributedTitleForItem(_ item: Int, inComponent component: Int) -> NSAttributedString? {
    return components[component].items[item].attributedTitle
  }
  
  open func didSelectItem(_ item: Int, inComponent component: Int) {
    let selectedComponentController = components[component]
    let selectedItemController = selectedComponentController.items[item]
    selectedComponentController.didSelectItemAtIndex(item)
    didSelectDelegate?.titlePickerControllerDidSelect(component: selectedComponentController, item: selectedItemController)
  }
  
  // MARK: Index Path
  
  private func indexPathForItemController(_ itemController: AUIPickerItemController) -> IndexPath? {
    var indexPath: IndexPath?
    components.forEach { (component) in
      guard let itemIndex = component.items.firstIndex(where: { $0 === itemController }) else { return }
      guard let componentIndex = components.firstIndex(where: { $0 === component}) else { return }
      indexPath = IndexPath(item: itemIndex, section: componentIndex)
    }
    return indexPath
  }
  
  // MARK: Select
  
  open override func select(_ itemController: AUIPickerItemController, animated: Bool) {
    guard let indexPath = indexPathForItemController(itemController) else { return }
    pickerView?.selectRow(indexPath.item, inComponent: indexPath.section, animated: animated)
  }
  
  // MARK: Selected item
  
  open func getSelectedItem(for component: AUITitlePickerComponentController) -> AUITitlePickerItemController? {
    guard
      let componentIndex = components.firstIndex(where: { $0 === component }),
      let itemIndex = pickerView?.selectedRow(inComponent: componentIndex) else { return nil }
    return component.items[itemIndex]
  }
}

private protocol  UIPickerViewDelegateProxyDelegate: class {
  func titleForItem(_ item: Int, inComponent component: Int) -> String?
  func attributedTitleForItem(_ item: Int, inComponent component: Int) -> NSAttributedString?
  func didSelectItem(_ item: Int, inComponent component: Int)
}

private class UIPickerViewDelegateProxy: NSObject, UIPickerViewDelegate {
  weak var delegate: UIPickerViewDelegateProxyDelegate?
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return delegate?.titleForItem(row, inComponent: component) ?? nil
  }
  
  func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    return delegate?.attributedTitleForItem(row, inComponent: component) ?? nil
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    delegate?.didSelectItem(row, inComponent: component)
  }
}
