//
//  AUIDefaultSegmentedControlItemController.swift
//  TOPLYVO UA
//
//  Created by Ihor Myroniuk on 2/20/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import UIKit

open class AUIEmptySegmentedControlItemController: AUISegmentedControlItemController {
    
    public init(title: String?) {
        self.title = title
    }
     
    public let title: String?
      
    open func didSelect() {
        
    }
}
