//
//  ButtonController.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 1/26/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultButtonController: AUIDefaultControlController, AUIButtonController {
  
  // MARK: View
  
  open var button: UIButton? {
    set { view = newValue }
    get { return view as? UIButton }
  }
  
  open override func setupView() {
    super.setupView()
    button?.setTitle(normalTitle, for: .normal)
  }
  
  // MARK: State
  
  open var title: String? {
    didSet { didSetTitle(oldValue: oldValue) }
  }
  open func didSetTitle(oldValue: String?) {
    normalTitle = title
  }
  
  open var normalTitle: String? {
    didSet { didSetNormalTitle(oldValue: oldValue) }
  }
  open func didSetNormalTitle(oldValue: String?) {
    button?.setTitle(title, for: .normal)
  }
  
  open var image: UIImage? {
    didSet{ didSetImage(oldValue: oldValue) }
  }
  open func didSetImage(oldValue: UIImage?) {
    normalImage = image
  }
  
  open var normalImage: UIImage? {
    didSet { didSetNormalImage(oldValue: oldValue) }
  }
  open func didSetNormalImage(oldValue: UIImage?) {
    button?.setImage(normalImage, for: .normal)
  }
  
}
