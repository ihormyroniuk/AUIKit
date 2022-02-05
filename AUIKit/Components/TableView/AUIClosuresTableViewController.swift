//
//  AUIClosuresTableViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 05.02.2022.
//

import Foundation

import UIKit

open class AUIClosuresTableViewController: AUIEmptyTableViewController {
    
    // MARK: Cells
    
    open var targetIndexPathForMoveFromRowAtClosure: ((AUITableViewCellController, AUITableViewCellController) -> AUITableViewCellController)?
    open override func targetIndexPathForMoveFromRowAt(sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        let sourceSection = sourceIndexPath.section
        let sourceRow = sourceIndexPath.row
        let sourceCellController = sectionControllers[sourceSection].cellControllers[sourceRow]
        let destinationSection = proposedDestinationIndexPath.section
        let destinationRow = proposedDestinationIndexPath.row
        let destinationCellController = sectionControllers[destinationSection].cellControllers[destinationRow]
        let targetCellController = targetIndexPathForMoveFromRowAtClosure?(sourceCellController, destinationCellController)
        return indexPathForCellController(targetCellController) ?? sourceIndexPath
    }
    
    private func indexPathForCellController(_ cellController: AUITableViewCellController?) -> IndexPath? {
        guard let cellController = cellController else { return nil }
        let sectionsCount = sectionControllers.count
        for section in 0..<sectionsCount {
            let cellControllers = sectionControllers[section].cellControllers
            let rowsCount = cellControllers.count
            for row in 0..<rowsCount {
                if cellController === cellControllers[row] {
                    let indexPath = IndexPath(row: row, section: section)
                    return indexPath
                }
            }
        }
        return nil
    }
    
    open var moveCellControllerClosure: ((AUITableViewCellController, AUITableViewCellController) -> Void)?
    open override func moveRowAt(sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let sourceSection = sourceIndexPath.section
        let sourceRow = sourceIndexPath.row
        let sourceCellController = sectionControllers[sourceSection].cellControllers[sourceRow]
        let destinationSection = destinationIndexPath.section
        let destinationRow = destinationIndexPath.row
        let destinationCellController = sectionControllers[destinationSection].cellControllers[destinationRow]
        super.moveRowAt(sourceIndexPath: sourceIndexPath, to: destinationIndexPath)
        moveCellControllerClosure?(sourceCellController, destinationCellController)
    }
    
}
