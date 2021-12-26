//
//  AUIViewPickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import Foundation

public protocol AUIViewPickerViewController: AUIPickerViewController {
  
    // MARK: Component Controllers
  
    var viewComponentControllers: [AUIViewPickerViewComponentController] { get set }
    
}
