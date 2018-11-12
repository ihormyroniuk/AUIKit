//
//  UITableView+DequeRegister.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/23/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

extension UITableView {
  
  public func dequeReusableCell<TVC: UITableViewCell>() -> TVC {
    let identifier = String(describing: TVC.self)
    let cell = dequeueReusableCell(withIdentifier: identifier)
    if let cell = cell as? TVC { return cell }
    register(TVC.self, forCellReuseIdentifier: identifier)
    return dequeReusableCell()
  }
  
  public func dequeReusableCell<TVC: UITableViewCell>(indexPath: IndexPath) -> TVC {
    let identifier = String(describing: TVC.self)
    register(TVC.self, forCellReuseIdentifier: identifier)
    return (dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TVC)!
  }
  
  public func dequeReusableHeaderFooterView<TVHF: UITableViewHeaderFooterView>() -> TVHF {
    let identifier = String(describing: TVHF.self)
    let view = dequeueReusableHeaderFooterView(withIdentifier: identifier)
    if let view = view as? TVHF { return view }
    register(TVHF.self, forHeaderFooterViewReuseIdentifier: identifier)
    return dequeReusableHeaderFooterView()
  }
  
}
