//
//  TableViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/14/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultTableViewController: AUIDefaultScrollViewController, AUITableViewController, AUITableViewDelegateProxyDelegate {

  // MARK: Delegates
  
  private let tableViewDelegateProxy = UITableViewDelegateProxy()
  
  // MARK: Controllers
  
  open var sectionControllers: [AUITableViewSectionController] = []
  
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

  /*func deleteSectionControllers(_ sectionControllers: [AUITableViewSectionController]) {
    let sections = sectionsForSectionControllers(sectionControllers)
    for section in sections {
      self.sectionControllers.remove(at: section)
    }
    reload()
  }
  func deleteSectionController(_ sectionController: AUITableViewSectionController) {
    deleteSectionControllers([sectionController])
  }
  
  func deleteSectionControllersAnimated(_ sectionControllers: [AUITableViewSectionController], _ animation: UITableViewRowAnimation) {
    let sections = sectionsForSectionControllers(sectionControllers)
    for section in sections {
      self.sectionControllers.remove(at: section)
    }
    genericScrollView?.deleteSections(IndexSet(sections), with: animation)
  }
  func deleteSectionControllerAnimated(_ sectionController: AUITableViewSectionController, _ animation: UITableViewRowAnimation) {
    deleteSectionControllersAnimated([sectionController], animation)
  }
  
  private func sectionsForSectionControllers(_ sectionControllers: [AUITableViewSectionController]) -> [Int] {
    var sections: [Int] = []
    for (section, sectionController) in self.sectionControllers.enumerated() {
      if sectionControllers.contains(where: { sectionController === $0 }) {
        sections.append(section)
      }
    }
    return sections
  }*/
  
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
  open func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation) {
    let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
    let indexPaths = indexPathsBySections.reduce([]) { $1.value }
    deletedIndexPaths = indexPaths
    deletedIndexPaths = indexPaths + indexPaths
    for (section, indexPaths) in indexPathsBySections {
      let rows = indexPaths.map({ $0.row })
      sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
    }
    CATransaction.begin()
    tableView?.beginUpdates()
    tableView?.deleteRows(at: indexPaths, with: animation)
    tableView?.endUpdates()
  }
  open func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation) {
    deleteCellControllersAnimated([cellController], animation)
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
  
  // MARK: Headers, Footers
  
  open func numberOfSections() -> Int {
    return sectionControllers.count
  }
  
  open func headerInSection(_ section: Int, tableView: UITableView) -> UIView? {
    return sectionControllers[section].header(tableView: tableView)
  }
  
  open func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
    return sectionControllers[section].headerEstimatedHeight
  }
  
  open func heightForHeaderInSection(_ section: Int) -> CGFloat {
    return sectionControllers[section].headerHeight
  }
  
  open func didEndDisplayingHeaderInSection(_ section: Int) {
    sectionControllers[section].didEndDisplayingHeader()
  }
  
  open func footerInSection(_ section: Int, tableView: UITableView) -> UIView? {
    return sectionControllers[section].footer(tableView: tableView)
  }
  
  open func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
    return sectionControllers[section].footerEstimatedHeight
  }
  
  open func heightForFooterInSection(_ section: Int) -> CGFloat {
    return sectionControllers[section].footerHeight
  }
  
  open func didEndDisplayingFooterInSection(_ section: Int) {
    sectionControllers[section].didEndDisplayingFooter()
  }
  
  // MARK: Cells
  
  open func numberOfRowsInSection(_ section: Int) -> Int {
    return sectionControllers[section].numberOfRows
  }
  
  open func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
    let section = indexPath.section
    return sectionControllers[section].cellForRowAtIndexPath(indexPath, tableView: tableView)
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
  
  open func didEndDisplayingAtIndexPath(_ indexPath: IndexPath) {
    if let index = deletedIndexPaths.index(of: indexPath) {
      deletedIndexPaths.remove(at: index)
      return
    }
    let section = indexPath.section
    let index = indexPath.row
    return sectionControllers[section].didEndDisplayingCellAtIndex(index: index)
  }
  
  open func willDisplayCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath) {
    if deletedIndexPaths.contains(indexPath) {
      deletedIndexPaths = deletedIndexPaths.filter({ $0 != indexPath })
    }
    let section = indexPath.section
    let index = indexPath.row
    return sectionControllers[section].willDisplayCell(cell, index: index)
  }
  
  open func didSelectCellAtIndexPath(_ indexPath: IndexPath) {
    let section = indexPath.section
    let index = indexPath.row
    sectionControllers[section].didSelectCellAtIndex(index)
  }
  
}

private protocol AUITableViewDelegateProxyDelegate: class {
  
  // MARK: Cells
  
  func numberOfRowsInSection(_ section: Int) -> Int
  func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
  func estimatedHeightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat
  func heightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat
  func willDisplayCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath)
  func didEndDisplayingAtIndexPath(_ indexPath: IndexPath)
  func didSelectCellAtIndexPath(_ indexPath: IndexPath)
  
  // MARK: Headers, Footers
  
  func numberOfSections() -> Int
  func headerInSection(_ section: Int, tableView: UITableView) -> UIView?
  func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat
  func heightForHeaderInSection(_ section: Int) -> CGFloat
  func didEndDisplayingHeaderInSection(_ section: Int)
  func footerInSection(_ section: Int, tableView: UITableView) -> UIView?
  func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat
  func heightForFooterInSection(_ section: Int) -> CGFloat
  func didEndDisplayingFooterInSection(_ section: Int)
}

private class UITableViewDelegateProxy: NSObject, UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
  
  weak var delegate: AUITableViewDelegateProxyDelegate?
  
  // MARK: Headers, Footers
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return delegate?.numberOfSections() ?? 0
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return delegate?.headerInSection(section, tableView: tableView)
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
    return delegate?.estimatedHeightForHeaderInSection(section) ?? 0
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return delegate?.heightForHeaderInSection(section) ?? 0
  }
  
  func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
    delegate?.didEndDisplayingHeaderInSection(section)
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return delegate?.footerInSection(section, tableView: tableView)
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
    return delegate?.estimatedHeightForFooterInSection(section) ?? 0
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return delegate?.heightForFooterInSection(section) ?? 0
  }
  
  func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
    delegate?.didEndDisplayingFooterInSection(section)
  }
  
  // MARK: Cells
  
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    
  }
  
  func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return delegate?.numberOfRowsInSection(section) ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return delegate?.cellForRowAtIndexPath(indexPath, tableView: tableView) ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return delegate?.estimatedHeightForCellAtIndexPath(indexPath) ?? 44
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return delegate?.heightForCellAtIndexPath(indexPath) ?? UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    delegate?.willDisplayCell(cell, atIndexPath: indexPath)
  }
  
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    delegate?.didEndDisplayingAtIndexPath(indexPath)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    delegate?.didSelectCellAtIndexPath(indexPath)
  }
  
}
