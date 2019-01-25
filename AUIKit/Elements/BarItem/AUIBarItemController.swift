//
//  BarItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/8/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIBarItemController: class {
  
  // MARK: Bar Item
  
  var barItem: UIBarItem? { get set }
  
  // MARK: Title
  
  var title: String? { get set }
  
  // MARK: Image
  
  var image: UIImage? { get set }
  var landscapeImagePhone: UIImage? { get set }
  @available(iOS 11.0, *)
  var largeContentSizeImage: UIImage? { get set }
  
  // MARK: Enabled
  
  var isEnabled: Bool { get set }
  
}
