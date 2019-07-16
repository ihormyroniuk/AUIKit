////
////  AUIUpdatableTableViewController.swift
////  AUIKit
////
////  Created by branderstudio on 7/13/19.
////
//
//import UIKit
//
//open class AUIUpdatableTableViewController: AUIDefaultScrollViewController, AUITableViewController, AUITableViewDelegateProxyDelegate {
//  
//  // MARK: - Delegate proxy
//  
//  private let tableViewDelegateProxy = UITableViewDelegateProxy()
//  
//  // MARK: Controllers
//  
//  open var sectionControllers: [AUITableViewSectionController] = []
//  
//  // MARK: Setup
//  
//  open override func setup() {
//    super.setup()
//    tableViewDelegateProxy.delegate = self
//  }
//  
//  // MARK: View
//  
//  open var tableView: UITableView? {
//    set { view = newValue }
//    get { return view as? UITableView }
//  }
//  
//  open override func setupView() {
//    super.setupView()
//    tableView?.dataSource = tableViewDelegateProxy
//    tableView?.delegate = tableViewDelegateProxy
//    tableView?.prefetchDataSource = tableViewDelegateProxy
//    tableView?.reloadData()
//  }
//  
//  open override func unsetupView() {
//    super.unsetupView()
//    tableView?.dataSource = nil
//    tableView?.delegate = nil
//    tableView?.prefetchDataSource = nil
//  }
//  
//  // MARK: Reload
//  
//  open func reload() {
//    tableView?.reloadData()
//  }
//  
//  // MARK: - Sections
//  
//  open func numberOfSections() -> Int {
//    return sectionControllers.count
//  }
//  
//  open func numberOfRowsInSection(_ section: Int) -> Int {
//    return sectionControllers[section].numberOfRows
//  }
//  
//  // MARK: Headers
//  
//  open func headerInSection(_ section: Int, tableView: UITableView) -> UIView? {
//    return sectionControllers[section].header(tableView: tableView)
//  }
//  
//  open func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
//    return sectionControllers[section].headerEstimatedHeight
//  }
//  
//  open func heightForHeaderInSection(_ section: Int) -> CGFloat {
//    return sectionControllers[section].headerHeight
//  }
//  
//  open func willDisplayHeaderView(_ view: UIView, forSection section: Int) {
//    
//  }
//  
//  open func didEndDisplayingHeaderInSection(_ section: Int) {
//    sectionControllers[section].didEndDisplayingHeader()
//  }
//  
//  // MARK: Footers
//  
//  open func footerInSection(_ section: Int, tableView: UITableView) -> UIView? {
//    return sectionControllers[section].footer(tableView: tableView)
//  }
//  
//  open func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
//    return sectionControllers[section].footerEstimatedHeight
//  }
//  
//  open func heightForFooterInSection(_ section: Int) -> CGFloat {
//    return sectionControllers[section].footerHeight
//  }
//  
//  open func willDisplayFooterView(_ view: UIView, forSection section: Int) {
//    
//  }
//  
//  open func didEndDisplayingFooterInSection(_ section: Int) {
//    sectionControllers[section].didEndDisplayingFooter()
//  }
//  
//  // MARK: Cells
//  
//  open func prefetchRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
//    
//  }
//  
//  open func cancelPrefetchingForRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
//    
//  }
//  
//  open func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
//    let section = indexPath.section
//    return sectionControllers[section].cellForRowAtIndexPath(indexPath, tableView: tableView)
//  }
//  
//  open func estimatedHeightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
//    let section = indexPath.section
//    let index = indexPath.row
//    return sectionControllers[section].estimatedHeightForCellAtIndex(index)
//  }
//  
//  open func heightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
//    let section = indexPath.section
//    let index = indexPath.row
//    return sectionControllers[section].heightForCellAtIndex(index)
//  }
//  
//  open func willDisplayCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath) {
////    if deletedIndexPaths.contains(indexPath) {
////      deletedIndexPaths = deletedIndexPaths.filter({ $0 != indexPath })
////    }
//    let section = indexPath.section
//    return sectionControllers[section].willDisplayCell(cell, index: indexPath)
//  }
//  
//  open func didSelectCellAtIndexPath(_ indexPath: IndexPath) {
//    let section = indexPath.section
//    let index = indexPath.row
//    sectionControllers[section].didSelectCellAtIndex(index)
//  }
//  
//  open func didEndDisplayingCellAtIndexPath(_ indexPath: IndexPath) {
////    if let index = deletedIndexPaths.index(of: indexPath) {
////      deletedIndexPaths.remove(at: index)
////      return
////    }
//    let section = indexPath.section
//    let index = indexPath.row
//    return sectionControllers[section].didEndDisplayingCellAtIndex(index: index)
//  }
//}
