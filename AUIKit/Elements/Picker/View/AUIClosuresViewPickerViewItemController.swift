//
//  AUIClosuresViewPickerViewItemController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 22.12.2021.
//

import Foundation

open class AUIClosuresViewPickerViewItemController: AUIEmptyViewPickerViewItemController {
    
    // MARK: Initializer
  
    public override init() {
        super.init()
    }
    
    open var viewReusingViewClosure: ((UIView?) -> UIView)?
    open override func view(reusingView view: UIView?) -> UIView {
        return viewReusingViewClosure?(view) ?? UIView()
    }
    
    open var didSelectClosure: (() -> Void)?
    open override func didSelect() {
        didSelectClosure?()
    }
  
}
