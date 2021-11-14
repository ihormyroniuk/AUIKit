//
//  StringsdictScreenViewController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 23.10.2021.
//

import UIKit
import AUIKit

protocol StringsdictScreenViewControllerDelegate: AnyObject {
    func stringsdictScreenViewControllerBack(_ stringsdictScreenViewController: StringsdictScreenViewController)
}

class StringsdictScreenViewController: AUIEmptyScreenController {
    
    // MARK: Delegate
    
    weak var delegate: StringsdictScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = StringsdictScreenView()
    }
    
    private var stringsdictScreenView: StringsdictScreenView! {
        return view as? StringsdictScreenView
    }
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        stringsdictScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
    }

    // MARK: Actions
    
    @objc private func back() {
        delegate?.stringsdictScreenViewControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        stringsdictScreenView.titleLabel.text = "Stringsdict"
        
        let formatString = NSLocalizedString("hi", tableName: "StringsdictScreen", bundle: Bundle(for: Self.self), value: "", comment: "")
        let resultString = String(format: formatString, 2)
        stringsdictScreenView.interactiveLabel.text = resultString
    }
    
}
