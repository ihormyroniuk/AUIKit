//
//  TableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITableViewCellController: AnyObject {
    func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
    func willDisplayCell(_ cell: UITableViewCell, indexPath: IndexPath)
    func didEndDisplayingCell()
    func didSelectCell()
    var estimatedHeight: CGFloat { get }
    var height: CGFloat { get }
}
