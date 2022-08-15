//
//  AUISegmentedControlController.swift
//  TOPLYVO UA
//
//  Created by Ihor Myroniuk on 2/20/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import UIKit

public protocol AUISegmentedControlController: AUIControlController {
    
    // MARK: UISegmentedControl
    
    var segmentedControl: UISegmentedControl? { get set }
    
    // MARK: Items
    
    var itemControllers: [AUISegmentedControlItemController] { get set }
}
