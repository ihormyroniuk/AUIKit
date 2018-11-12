//
//  AUIGenericContainerTableViewHeaderFooterView.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/18/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIGenericContainerTableViewHeaderFooterView<V: UIView>: AUIContainerTableViewHeaderFooterView {
  
  // MARK: Elements
  
  public let genericView: V = V()
  open override var view: UIView {
    return genericView
  }
  
}
