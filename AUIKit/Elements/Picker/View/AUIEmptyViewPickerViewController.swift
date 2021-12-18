//
//  AUIDefaultViewPickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import UIKit

open class AUIEmptyViewPickerViewController: AUIEmptyPickerViewController, AUIViewPickerViewController, UIPickerViewDelegateProxyDelegate {
  
    // MARK: Delegates
  
    private let pickerViewDelegateProxy = UIPickerViewDelegateProxy()
  
    // MARK: Component Controllers
  
    open var viewComponentControllers: [AUIViewPickerViewComponentController] = [] {
        didSet {
            didSetViewComponentControllers(oldValue)
        }
    }
    func didSetViewComponentControllers(_ oldValue: [AUIViewPickerViewComponentController]) {
        pickerView?.reloadAllComponents()
    }
  
    open override var componentControllers: [AUIPickerViewComponentController] {
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
        return viewComponentControllers[component].viewItemControllers[item].view(reusingView: view)
    }
    
    func widthForComponent(_ component: Int) -> CGFloat {
        return viewComponentControllers[component].width
    }
    
    func heightForComponent(_ component: Int) -> CGFloat {
        return viewComponentControllers[component].height
    }
  
    open func didSelectItem(_ item: Int, inComponent component: Int) {
        guard componentControllers.count < component else { return }
        let componentController = componentControllers[component]
        guard componentController.itemControllers.count < item else { return }
        let itemController = componentController.itemControllers[item]
        for object in didSelectItemControllerObservers.allObjects {
            guard let observer = object as? AUIPickerViewControllerDidSelectItemControllerObserver else { continue }
            observer.pickerViewController(self, didSelectItemController: itemController, atComponentController: componentController)
        }
    }
}

private protocol  UIPickerViewDelegateProxyDelegate: AnyObject {
    
    func viewForItem(_ item: Int, inComponent component: Int, reusingView view: UIView?) -> UIView
    func widthForComponent(_ component: Int) -> CGFloat
    func heightForComponent(_ component: Int) -> CGFloat
    func didSelectItem(_ item: Int, inComponent component: Int)
    
}

private class UIPickerViewDelegateProxy: NSObject, UIPickerViewDelegate {
    
    weak var delegate: UIPickerViewDelegateProxyDelegate?
  
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return delegate?.viewForItem(row, inComponent: component, reusingView: view) ?? UIView()
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return delegate?.widthForComponent(component) ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return delegate?.heightForComponent(component) ?? 0
    }
  
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.didSelectItem(row, inComponent: component)
    }
    
}
