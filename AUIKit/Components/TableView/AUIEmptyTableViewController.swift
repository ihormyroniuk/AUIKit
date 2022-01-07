//
//  TableViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/14/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyTableViewController: AUIEmptyScrollViewController, AUITableViewController, AUITableViewDelegateProxyDelegate {
    
    // MARK: Delegates
  
    private let tableViewDelegateProxy = UITableViewDelegateProxy()
  
    // MARK: Controllers
  
    open var sectionControllers: [AUITableViewSectionController] = [] {
        didSet {
            didSetSectionControllers(oldValue)
        }
    }
    open func didSetSectionControllers(_ oldValue: [AUITableViewSectionController]) {
        reload()
    }
  
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        tableViewDelegateProxy.delegate = self
    }
  
    // MARK: View
  
    open var tableView: UITableView? {
        set { view = newValue }
        get { return view as? UITableView }
    }
  
    open override func setupView() {
        super.setupView()
        tableView?.dataSource = tableViewDelegateProxy
        tableView?.delegate = tableViewDelegateProxy
        tableView?.prefetchDataSource = tableViewDelegateProxy
        tableView?.reloadData()
    }

    open override func unsetupView() {
        super.unsetupView()
        tableView?.dataSource = nil
        tableView?.delegate = nil
        tableView?.prefetchDataSource = nil
    }
  
    // MARK: Reload
  
    open func reload() {
        tableView?.reloadData()
    }
  
    open func deleteCellControllers(_ cellControllers: [AUITableViewCellController]) {
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        for (section, indexPaths) in indexPathsBySections {
            let rows = indexPaths.map({ $0.row })
            sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
        }
        reload()
    }
    open func deleteCellController(_ cellController: AUITableViewCellController) {
        deleteCellControllers([cellController])
    }
  
    open var deletedIndexPaths: [IndexPath] = []
    open func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        let indexPaths = indexPathsBySections.reduce([]) { $1.value }
        deletedIndexPaths = indexPaths
        deletedIndexPaths = indexPaths + indexPaths
        for (section, indexPaths) in indexPathsBySections {
            let rows = indexPaths.map({ $0.row })
            sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
        }
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.deleteRows(at: indexPaths, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.deleteRows(at: indexPaths, with: animation)
            tableView?.endUpdates()

        }
    }
    open func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        deleteCellControllersAnimated([cellController], animation, completion: completion)
    }
  
    open func insertCellControllerAtSectionEnd(_ section: AUITableViewSectionController, cellController: AUITableViewCellController) {
        /*guard let sectionIndex = self.sectionControllers.firstIndex(where: { $0 === section }) else { return }
         let itemIndex = section.cellControllers.count*/
        section.cellControllers.append(cellController)
        reload()
    }
  
  open func insertCellControllerAtSectionBeginning(_ section: AUITableViewSectionController, cellController: AUITableViewCellController) {
    if section.cellControllers.isEmpty {
      section.cellControllers.append(cellController)
    } else {
      section.cellControllers.insert(cellController, at: 0)
    }
    reload()
  }
  
  public func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController) {
    guard let index = section.cellControllers.firstIndex(where: { $0 === cellController }) else { return }
    section.cellControllers.insert(contentsOf: cellControllers, at: index + 1)
    reload()
  }
  
  private func indexPathsBySectionsForCellControllers(_ cellControllers: [AUITableViewCellController]) -> [Int: [IndexPath]] {
    var indexPathsBySections: [Int: [IndexPath]] = [:]
    for (section, sectionController) in sectionControllers.enumerated() {
      var indexPaths: [IndexPath] = []
      for (row, cellController) in sectionController.cellControllers.enumerated() {
        if cellControllers.contains(where: { $0 === cellController }) {
          let indexPath = IndexPath(row: row, section: section)
          indexPaths.append(indexPath)
        }
      }
      indexPathsBySections[section] = indexPaths
    }
    return indexPathsBySections
  }
  
  
  
    open func numberOfSections() -> Int {
        return sectionControllers.count
    }
  
    open func numberOfRowsInSection(_ section: Int) -> Int {
        return sectionControllers[section].numberOfRows
    }
  
    // MARK: Headers
  
    open func headerInSection(_ section: Int) -> UIView? {
        return sectionControllers[section].header()
    }
  
    open func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
        return sectionControllers[section].headerEstimatedHeight
    }
  
    open func heightForHeaderInSection(_ section: Int) -> CGFloat {
        return sectionControllers[section].headerHeight
    }
  
    open func willDisplayHeaderViewForSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        sectionControllers[section].willDisplayHeader()
    }
  
    open func didEndDisplayingHeaderInSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        sectionControllers[section].didEndDisplayingHeader()
    }
  
    // MARK: Cells
  
    open func prefetchRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let index = indexPath.row
            sectionControllers[section].prefetchCellAtIndex(index)
        }
    }
  
    open func cancelPrefetchingForRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let index = indexPath.row
            sectionControllers[section].cancelPrefetchingForCellAtIndex(index)
        }
    }
  
    open func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        return sectionControllers[section].cellForRowAtIndexPath(indexPath)
    }
  
    open func estimatedHeightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        let index = indexPath.row
        return sectionControllers[section].estimatedHeightForCellAtIndex(index)
    }
  
    open func heightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        let index = indexPath.row
        return sectionControllers[section].heightForCellAtIndex(index)
    }
  
    open func willDisplayCellAtIndexPath(_ indexPath: IndexPath) {
        if deletedIndexPaths.contains(indexPath) {
            deletedIndexPaths = deletedIndexPaths.filter({ $0 != indexPath })
        }
        let section = indexPath.section
        return sectionControllers[section].willDisplayCell(index: indexPath)
    }
  
    open func didSelectCellAtIndexPath(_ indexPath: IndexPath) {
        let section = indexPath.section
        let index = indexPath.row
        sectionControllers[section].didSelectCellAtIndex(index)
    }
  
    open func didEndDisplayingCellAtIndexPath(_ indexPath: IndexPath) {
        guard indexPath.section < sectionControllers.count else { return }
        if let index = deletedIndexPaths.firstIndex(of: indexPath) {
            deletedIndexPaths.remove(at: index)
            return
        }
        let section = indexPath.section
        let index = indexPath.row
        return sectionControllers[section].didEndDisplayingCellAtIndex(index: index)
    }
    
    // MARK: Footers
  
    open func footerInSection(_ section: Int) -> UIView? {
        return sectionControllers[section].footer()
    }
  
    open func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
        return sectionControllers[section].footerEstimatedHeight
    }
  
    open func heightForFooterInSection(_ section: Int) -> CGFloat {
        return sectionControllers[section].footerHeight
    }
  
    open func willDisplayFooterViewForSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        sectionControllers[section].willDisplayFooter()
    }
  
    open func didEndDisplayingFooterInSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        sectionControllers[section].didEndDisplayingFooter()
    }
}

private protocol AUITableViewDelegateProxyDelegate: AnyObject {
  
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
  
    // MARK: Headers

    func headerInSection(_ section: Int) -> UIView?
    func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat
    func heightForHeaderInSection(_ section: Int) -> CGFloat
    func willDisplayHeaderViewForSection(_ section: Int)
    func didEndDisplayingHeaderInSection(_ section: Int)
  
    // MARK: Cells
  
    func prefetchRowsAtIndexPaths(_ indexPaths: [IndexPath])
    func cancelPrefetchingForRowsAtIndexPaths(_ indexPaths: [IndexPath])
    func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell
    func estimatedHeightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat
    func heightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat
    func willDisplayCellAtIndexPath(_ indexPath: IndexPath)
    func didEndDisplayingCellAtIndexPath(_ indexPath: IndexPath)
    func didSelectCellAtIndexPath(_ indexPath: IndexPath)
  
    // MARK: Footers
  
    func footerInSection(_ section: Int) -> UIView?
    func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat
    func heightForFooterInSection(_ section: Int) -> CGFloat
    func willDisplayFooterViewForSection(_ section: Int)
    func didEndDisplayingFooterInSection(_ section: Int)
    
}

private class UITableViewDelegateProxy: NSObject, UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
      
    weak var delegate: AUITableViewDelegateProxyDelegate?
      
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.numberOfSections() ?? 0
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfRowsInSection(section) ?? 0
    }
      
    // MARK: Headers
      
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return delegate?.headerInSection(section)
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.estimatedHeightForHeaderInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.heightForHeaderInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        delegate?.willDisplayHeaderViewForSection(section)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        delegate?.didEndDisplayingHeaderInSection(section)
    }
      
    // MARK: Cells

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        delegate?.prefetchRowsAtIndexPaths(indexPaths)
    }
      
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        delegate?.cancelPrefetchingForRowsAtIndexPaths(indexPaths)
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return delegate?.cellForRowAtIndexPath(indexPath) ?? UITableViewCell()
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.estimatedHeightForCellAtIndexPath(indexPath) ?? 44
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.heightForCellAtIndexPath(indexPath) ?? UITableView.automaticDimension
    }
      
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.willDisplayCellAtIndexPath(indexPath)
    }
      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectCellAtIndexPath(indexPath)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.didEndDisplayingCellAtIndexPath(indexPath)
    }
    
    // MARK: Footers
      
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return delegate?.footerInSection(section)
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return delegate?.estimatedHeightForFooterInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return delegate?.heightForFooterInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        delegate?.willDisplayFooterViewForSection(section)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        delegate?.didEndDisplayingFooterInSection(section)
    }
  
}