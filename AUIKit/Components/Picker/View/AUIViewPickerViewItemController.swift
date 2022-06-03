//
//  AUIViewPickerItemController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import Foundation
import UIKit

public protocol AUIViewPickerViewItemController: AUIPickerViewItemController {
  
    // MARK: View
  
    func view(reusingView view: UIView?) -> UIView
  
}
