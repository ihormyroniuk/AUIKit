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
    }
    
    private func setupTableViewController() {
        tableViewController.tableView = tableViewScreenView.tableView
        var cellControllers: [AUITableViewCellController] = []
        for i in 1...100 {
            let cellConroller = AUIClosuresTableViewCellController()
            cellConroller.cellForRowAtIndexPathClosure = { indexPath in
                let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
                cell.textLabel?.text = "text #\(i)"
                cell.detailTextLabel?.text = "detail #\(i)"
                return cell
            }
            cellConroller.heightClosure = {
                return 64
            }
            cellConroller.willDisplayCellClosure = {
                print("will display text #\(i)")
            }
            cellConroller.didSelectClosure = {
                print("did select text #\(i)")
            }
            cellConroller.didEndDisplayingCellClosure = {
                print("did end displaying text #\(i)")
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
