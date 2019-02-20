//
//  AUIDefaultSegmentedControlItemController.swift
//  TOPLYVO UA
//
//  Created by Ihor Myroniuk on 2/20/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultSegmentedControlItemController: AUISegmentedControlItemController {
    
    // MARK: Title
 
    open var title: String?
    
    open weak var didSelectDelegate: AUISegmentedControlItemControllerDidSelectDelegate?
    
    open func didSelect() {
        didSelectDelegate?.didSelectSegmentedControlItemController(self)
    }
}
