//
//  AUITableViewHeaderFooterController.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/18/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITableViewHeaderFooterController: AnyObject {
    func view() -> UITableViewHeaderFooterView?
    var estimatedHeight: CGFloat { get }
    var height: CGFloat { get }
    func willDisplay()
    func didEndDisplaying()
}
