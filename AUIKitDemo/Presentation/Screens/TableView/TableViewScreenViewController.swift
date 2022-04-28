//
//  TestTableViewScreenViewController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 23.12.2021.
//

import AUIKit

protocol TableViewScreenViewControllerDelegate: AnyObject {
    func tableViewScreenViewControllerBack(_ testTableViewScreenViewController: TableViewScreenViewController)
}

final class TableViewScreenViewController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: TableViewScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = TableViewScreenView()
    }
    
    private var tableViewScreenView: TableViewScreenView! {
        return view as? TableViewScreenView
    }
    
    // MARK: Components
    
    private let tableViewController = AUIEmptyTableViewController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
        setupTableViewController()
        tableViewController.scrollViewDidScrollClosure = {
            print("fffff")
        }
    }
    
    private func setupTableViewController() {
        tableViewController.tableView = tableViewScreenView.tableView
        tableViewController.dragInteractionEnabled = true
        var cellControllers: [AUITableViewCellController] = []
        for i in 1...100 {
            let cellConroller = AUIClosuresTableViewCellController()
            cellConroller.cellForRowAtIndexPathClosure = { indexPath in
                let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
                cell.textLabel?.text = "text #\(i)"
                cell.detailTextLabel?.text = "detail #\(i)"
                return cell
            }
            cellConroller.estimatedHeightClosure = {
                return 64
            }
            cellConroller.heightClosure = {
                return 64
            }
            cellConroller.willDisplayCellClosure = {
                print("willDisplayCellClosure #\(i)")
            }
            cellConroller.didSelectClosure = { [weak self] in
                guard let self = self else { return }
                self.tableViewController.deleteCellControllerAnimated(cellConroller, .fade, completion: { finished in
                    print("deleteCellControllerAnimated finished")
                })
            }
            cellConroller.didEndDisplayingCellClosure = {
                print("didEndDisplayingCellClosure #\(i)")
            }
            cellConroller.prefetchCellClosure = {
                print("prefetchCellClosure #\(i)")
            }
            cellConroller.cancelPrefetchingForCellClosure = {
                print("cancelPrefetchingForCellClosure #\(i)")
            }
            cellConroller.trailingSwipeActionsConfigurationForCellClosure = {
                let deleteContextualAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] contextualAction, view, completion in
                    guard let self = self else { return }
                    self.tableViewController.deleteCellControllerAnimated(cellConroller, .right, completion: { finished in
                        completion(false)
                    })
                }
                let configuration = UISwipeActionsConfiguration(actions: [deleteContextualAction])
                configuration.performsFirstActionWithFullSwipe = true
                return configuration
            }
            cellConroller.canMoveCellClosure = {
                return true
            }
            cellControllers.append(cellConroller)
        }
        let sectionController = AUIEmptyTableViewSectionController()
        sectionController.cellControllers = cellControllers
        tableViewController.sectionControllers = [sectionController]
    }

    // MARK: Actions
    
    @objc private func back() {
        delegate?.tableViewScreenViewControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        tableViewScreenView.titleLabel.text = "TableView"
    }
    
}
