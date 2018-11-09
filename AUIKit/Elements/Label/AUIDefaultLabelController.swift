//
//  HeaderController.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 1/25/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultLabelController: AUIDefaultViewController, AUILabelController {
  
  // MARK: View
  
  open var label: UILabel? {
    set { view = newValue }
    get { return view as? UILabel }
  }
  
  open override func setupView() {
    super.setupView()
    label?.text = text
  }
  
  // MARK: State
  
  open var text: String? {
    didSet { didSetText() }
  }
  open func didSetText() {
    label?.text = text
  }
  
}
