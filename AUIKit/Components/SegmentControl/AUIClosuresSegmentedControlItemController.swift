//
//  AUIClosuresSegmentedControlItemController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 15.08.2022.
//

import UIKit

open class AUIClosuresSegmentedControlItemController: AUIEmptySegmentedControlItemController {
           
    open var didSelectClosure: (() -> Void)?
    open override func didSelect() {
        super.didSelect()
        didSelectClosure?()
    }
    
}
