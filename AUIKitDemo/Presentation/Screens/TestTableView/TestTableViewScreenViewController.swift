//
//  TestTableViewScreenViewController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 23.12.2021.
//

import AUIKit

protocol TestTableViewScreenViewControllerDelegate: AnyObject {
    func testTableViewScreenViewControllerBack(_ testTableViewScreenViewController: TestTableViewScreenViewController)
}

final class TestTableViewScreenViewController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: TestTableViewScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = TestTableViewScreenView()
    }
    
    private var testTableViewScreenView: TestTableViewScreenView! {
        return view as? TestTableViewScreenView
    }
    
    // MARK: Components
    
    private let tableViewController = AUIEmptyTableViewController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testTableViewScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
        setupTableViewController()
    }
    
    private func setupTableViewController() {
        tableViewController.tableView = testTableViewScreenView.tableView
        var cellControllers: [AUITableViewCellController] = []
        for i in 1...100 {
            let cellConroller = AUIClosuresTableViewCellController()
            cellConroller.cellForRowAtIndexPathClosure = { tableView, indexPath in
                let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
                cell.textLabel?.text = "text #\(i)"
                cell.detailTextLabel?.text = "detail #\(i)"
                return cell
            }
            cellConroller.heightClosure = {
                return 64
            }
            cellConroller.didSelectClosure = {
                print("text #\(i)")
            }
            cellControllers.append(cellConroller)
        }
        let sectionController = AUIEmptyTableViewSectionController()
        sectionController.cellControllers = cellControllers
        tableViewController.sectionControllers = [sectionController]
    }

    // MARK: Actions
    
    @objc private func back() {
        delegate?.testTableViewScreenViewControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        testTableViewScreenView.titleLabel.text = "Test TableView"
    }
    
}
