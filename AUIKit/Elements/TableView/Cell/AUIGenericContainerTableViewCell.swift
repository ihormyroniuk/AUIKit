//
//  ContainerCollectionViewCell.swift
//  Smaug
//
//  Created by Ihor Myroniuk on 11/23/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

open class AUIGenericContainerTableViewCell<V: UIView>: AUIContainerTableViewCell {
  
  // MARK: Elements
  
  public let genericView: V = V()
  open override var view: UIView {
    return genericView
  }
  
}
