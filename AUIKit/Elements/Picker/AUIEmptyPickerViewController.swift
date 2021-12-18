//
//  AUIDefaultPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyPickerViewController: AUIEmptyViewController, AUIPickerViewController, UIPickerViewDataSourceProxyDelegate {
  
    // MARK: Components
  
    open var componentControllers: [AUIPickerViewComponentController] {
        return []
    }
  
    // MARK: Ovservers
  
    open var didSelectItemControllerObservers = NSHashTable<AnyObject>.weakObjects()
  
    open func addDidSelectItemControllerObserver(_ observer: AUIPickerViewControllerDidSelectItemControllerObserver) {
        didSelectItemControllerObservers.add(observer)
    }
  
    open func removeDidSelectItemControllerObserver(_ observer: AUIPickerViewControllerDidSelectItemControllerObserver) {
        didSelectItemControllerObservers.remove(observer)
    }

    // MARK: Delegates
  
    private let pickerViewDataSourceProxy = UIPickerViewDataSourceProxy()
  
    // MAKR: Setup
  
    open override func setup() {
        super.setup()
        pickerViewDataSourceProxy.delegate = self
    }
  
    // MARK: UIPickerView
  
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
        return componentControllers.count
    }
  
    open func numberOfItemsInComponent(_ component: Int) -> Int {
        return componentControllers[component].itemControllers.count
    }
  
    // MARK: Select ItemController

    open func selectItemController(_ itemController: AUIPickerViewItemController, atComponentController componentController: AUIPickerViewComponentController, animated: Bool) {
        guard let component = componentControllers.firstIndex(where: { $0 === componentController }) else { return }
        guard let item = componentController.itemControllers.firstIndex(where: { $0 === itemController }) else { return }
        pickerView?.selectRow(item, inComponent: component, animated: true)
    }
  
    public func selectedItemController(atComponentController componentController: AUIPickerViewComponentController) -> AUIPickerViewItemController? {
        guard let component = componentControllers.firstIndex(where: { $0 === componentController }) else { return nil }
        guard let item = pickerView?.selectedRow(inComponent: component) else { return nil }
        return componentController.itemControllers[item]
    }
    
}

private protocol  UIPickerViewDataSourceProxyDelegate: AnyObject {
    
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
