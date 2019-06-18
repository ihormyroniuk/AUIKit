//
//  AUIImageViewContentModeScaleAspectFit.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/14/19.
//

import UIKit

open class AUIImageViewContentModeScaleAspectFit: AUIImageView {
  
  open override func setup() {
    super.setup()
    contentMode = .scaleAspectFit
  }
  
}
