//
//  AUITextField.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/15/19.
//

import UIKit

open class AUITextField: UITextField {
  
  // MARK: Initializers

   public override init(frame: CGRect = .zero) {
       super.init(frame: frame)
       setup()
       autoLayout()
   }

  @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setup()
       autoLayout()
   }

   // MARK: Setup

   open func setup() {

   }

   // MARK: AutoLayout

   open func autoLayout() {

   }
  
}
