//
//  AUIDefaultTitlePickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyTitlePickerViewController: AUIEmptyPickerViewController, AUITitlePickerViewController {

    // MARK: Delegates
  
    private let pickerViewDelegateProxy = UIPickerViewDelegateProxy()
  
    // MARK: Component Controllers
  
    open var titleComponentControllers: [AUITitlePickerViewComponentController] = [] {
        didSet {
            didSetTitleComponentControllers(oldValue)
        }
    }
    open func didSetTitleComponentControllers(_ oldValue: [AUITitlePickerViewComponentController]) {
        didSetComponentControllers(oldValue)
    }
  
    open override var componentControllers: [AUIPickerViewComponentController] {
        return titleComponentControllers
    }
  
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        pickerViewDelegateProxy.delegate = self
    }
  
    // MARK: UIPickerView
  
    open override func setupPickerView() {
        super.setupPickerView()
        pickerView?.delegate = pickerViewDelegateProxy
        pickerView?.reloadAllComponents()
    }
  
    open override func unsetupPickerView() {
        super.unsetupPickerView()
        pickerView?.delegate = nil
    }
  
    // MARK: UIPickerViewDelegateProxyDelegate
  
    open func titleForItem(_ item: Int, inComponent component: Int) -> String? {
        return titleComponentControllers[component].titleItemControllers[item].title
    }
  
    open func attributedTitleForItem(_ item: Int, inComponent component: Int) -> NSAttributedString? {
        return titleComponentControllers[component].titleItemControllers[item].attributedTitle
    }
  
    open func didSelectItem(_ item: Int, inComponent component: Int) {
        guard component >= 0, component < titleComponentControllers.count else { return }
        let componentController = componentControllers[component]
        guard item >= 0, item < componentController.itemControllers.count else { return }
        let itemController = componentController.itemControllers[item]
        didSelectItemController(itemController, inComponentController: componentController)
    }
    
}

private class UIPickerViewDelegateProxy: NSObject, UIPickerViewDelegate {
    
    weak var delegate: AUIEmptyTitlePickerViewController?
  
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
