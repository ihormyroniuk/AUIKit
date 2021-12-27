//
//  TestTableViewScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 23.12.2021.
//

import AUIKit

class TableViewScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let tableView = UITableView()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(tableView)
        setupTableView()
    }
    
    private func setupTableView() {

    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTableView()
    }
    
    private func layoutTableView() {
        let x: CGFloat = 0
        let y = navigationBarView.frame.origin.y + navigationBarView.frame.size.height
        let width = bounds.width
        let height: CGFloat = bounds.height - y
        let frame = CGRect(x: x, y: y, width: width, height: height)
        tableView.frame = frame
    }
    
}
