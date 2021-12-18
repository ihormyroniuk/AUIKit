//
//  AUIDefaultTitlePickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyTitlePickerViewController: AUIEmptyPickerViewController, AUITitlePickerViewController, UIPickerViewDelegateProxyDelegate {

    // MARK: Delegates
  
    private let pickerViewDelegateProxy = UIPickerViewDelegateProxy()
  
    // MARK: Component Controllers
  
    open var titleComponentControllers: [AUITitlePickerViewComponentController] = [] {
        didSet {
            didSetTitleComponentControllers(oldValue)
        }
    }
    func didSetTitleComponentControllers(_ oldValue: [AUITitlePickerViewComponentController]) {
        pickerView?.reloadAllComponents()
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
  
    open func titleForItem(_ item: Int, inComponent component: Int) -> String? {
        return titleComponentControllers[component].titleItemControllers[item].title
    }
  
    open func attributedTitleForItem(_ item: Int, inComponent component: Int) -> NSAttributedString? {
        return titleComponentControllers[component].titleItemControllers[item].attributedTitle
    }
  
    open func didSelectItem(_ item: Int, inComponent component: Int) {
        guard componentControllers.count > component else { return }
        let componentController = componentControllers[component]
        guard componentController.itemControllers.count > item else { return }
        let itemController = componentController.itemControllers[item]
        for object in didSelectItemControllerObservers.allObjects {
            guard let observer = object as? AUIPickerViewControllerDidSelectItemControllerObserver else { continue }
            observer.pickerViewController(self, didSelectItemController: itemController, atComponentController: componentController)
        }
    }
    
}

private protocol  UIPickerViewDelegateProxyDelegate: AnyObject {
    
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
