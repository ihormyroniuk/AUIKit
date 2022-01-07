//
//  AUISegmentedControlController.swift
//  TOPLYVO UA
//
//  Created by Ihor Myroniuk on 2/20/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import UIKit

public protocol AUISegmentedControlController: AUIControlController {
    
    // MARK: SegmentedControl
    
    var segmentedControl: UISegmentedControl? { get set }
}
