//
//  AUIDefaultViewPickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import UIKit

open class AUIEmptyViewPickerViewController: AUIEmptyPickerViewController, AUIViewPickerViewController {
  
    // MARK: Delegates
  
    private let pickerViewDelegateProxy = UIPickerViewDelegateProxy()
  
    // MARK: Component Controllers
  
    open var viewComponentControllers: [AUIViewPickerViewComponentController] = [] {
        didSet {
            didSetViewComponentControllers(oldValue)
        }
    }
    open func didSetViewComponentControllers(_ oldValue: [AUIViewPickerViewComponentController]) {
        didSetComponentControllers(oldValue)
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
  
    open override func setupPickerView() {
        super.setupView()
        pickerView?.delegate = pickerViewDelegateProxy
        pickerView?.reloadAllComponents()
    }
  
    open override func unsetupPickerView() {
        super.unsetupView()
        pickerView?.delegate = nil
    }
  
    // MARK: UIPickerViewDelegateProxyDelegate
  
    open func viewForItem(_ item: Int, inComponent component: Int, reusingView view: UIView?) -> UIView {
        guard component >= 0, component < componentControllers.count else { return UIView() }
        let componentController = viewComponentControllers[component]
        guard item >= 0, item < componentController.itemControllers.count else { return UIView() }
        let itemController = componentController.viewItemControllers[item]
        return itemController.view(reusingView: view)
    }
    
    open func widthForComponent(_ component: Int) -> CGFloat {
        guard component >= 0, component < viewComponentControllers.count else { return 0 }
        return viewComponentControllers[component].width
    }
    
    open func heightForComponent(_ component: Int) -> CGFloat {
        guard component >= 0, component < viewComponentControllers.count else { return 0 }
        return viewComponentControllers[component].height
    }
  
    open func didSelectItem(_ item: Int, inComponent component: Int) {
        guard component >= 0, component < viewComponentControllers.count else { return }
        let componentController = componentControllers[component]
        guard item >= 0, item < componentController.itemControllers.count else { return }
        let itemController = componentController.itemControllers[item]
        didSelectItemController(itemController, inComponentController: componentController)
    }
}

private class UIPickerViewDelegateProxy: NSObject, UIPickerViewDelegate {
    
    weak var delegate: AUIEmptyViewPickerViewController?
  
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
