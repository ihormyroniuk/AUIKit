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
    didSet { didSetTitle() }
  }
  open func didSetTitle() {
    normalTitle = title
  }
  
  open var normalTitle: String? {
    didSet { didSetNormalTitle() }
  }
  open func didSetNormalTitle() {
    button?.setTitle(title, for: .normal)
  }
  
  open var image: UIImage? {
    didSet{ didSetImage() }
  }
  open func didSetImage() {
    normalImage = image
  }
  
  open var normalImage: UIImage? {
    didSet { didSetNormalImage() }
  }
  open func didSetNormalImage() {
    button?.setImage(normalImage, for: .normal)
  }
  
}
