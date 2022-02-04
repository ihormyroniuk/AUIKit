//
//  TableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITableViewCellController: AnyObject {
    func prefetchCell()
    func cancelPrefetchingForCell()
    func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell
    var estimatedHeight: CGFloat { get }
    var height: CGFloat { get }
    func willDisplayCell()
    func didSelectCell()
    func didEndDisplayingCell()
    @available(iOS 11.0, *)
    var leadingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? { get }
    @available(iOS 11.0, *)
    var trailingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? { get }
    @available(iOS 11.0, *)
    func itemsForBeginning(session: UIDragSession) -> [UIDragItem]
    var canMoveCell: Bool { get }
}
