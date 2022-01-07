//
//  AUISegmentedControlItemController.swift
//  TOPLYVO UA
//
//  Created by Ihor Myroniuk on 2/20/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import UIKit

public protocol AUISegmentedControlItemControllerDidSelectDelegate: AnyObject {
    func didSelectSegmentedControlItemController(_ itemController: AUISegmentedControlItemController)
}

public protocol AUISegmentedControlItemController: AnyObject {
    
    // MARK: Title
    
    var title: String? { get }
    
    var didSelectDelegate: AUISegmentedControlItemControllerDidSelectDelegate? { get set }
    func didSelect()
    
}
