//
//  MenuScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 09.08.2020.
//
import UIKit
import AUIKit

protocol MenuScreenControllerDelegate: AnyObject {
    func menuScreenControllerDisplayIntroScreen(_ menuScreenController: MenuScreenController)
    func menuScreenControllerDisplayLabelsScreen(_ menuScreenController: MenuScreenController)
    func menuScreenControllerDisplayInteractiveLabelsScreen(_ menuScreenController: MenuScreenController)
    func menuScreenControllerDisplaySignupScreen(_ menuScreenController: MenuScreenController)
    func menuScreenControllerDisplayTextFieldTextInputViewScreen(_ menuScreenController: MenuScreenController)
    func menuScreenControllerDisplayPresentAnimations(_ menuScreenController: MenuScreenController)
    func menuScreenControllerDisplayPushAnimations(_ menuScreenController: MenuScreenController)
}

class MenuScreenController: AUIEmptyScreenController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Delegate
    
    weak var delegate: MenuScreenControllerDelegate?
    
    // MARK: Data
    
    private enum Item: Int, CaseIterable {
        case intro
        case labels
        case interactiveLabels
        case signup
        case textFieldTextInputView
        case presentAnimations
        case pushAnimations
    }
    
    // MARK: View
    
    private var menuScreenView: MenuScreenView! {
        return view as? MenuScreenView
    }
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        setupCollectionView()
        setContent()
    }
    
    private func setupCollectionView() {
        menuScreenView.collectionView.dataSource = self
        menuScreenView.collectionView.delegate = self
    }
    
    // MARK: Actions
    
    private func displayItem(_ item: Item) {
        switch item {
        case .intro:
            delegate?.menuScreenControllerDisplayIntroScreen(self)
        case .labels:
            delegate?.menuScreenControllerDisplayLabelsScreen(self)
        case .interactiveLabels:
            delegate?.menuScreenControllerDisplayInteractiveLabelsScreen(self)
        case .signup:
            delegate?.menuScreenControllerDisplaySignupScreen(self)
        case .textFieldTextInputView:
            delegate?.menuScreenControllerDisplayTextFieldTextInputViewScreen(self)
        case .presentAnimations:
            delegate?.menuScreenControllerDisplayPresentAnimations(self)
        case .pushAnimations:
            delegate?.menuScreenControllerDisplayPushAnimations(self)
        }
    }
    
    // MARK: Content
    
    private func setContent() {
        menuScreenView.titleLabel.text = "Menu"
    }
    
    private func itemTitle(_ item: Item) -> String {
        switch item {
        case .intro:
            return "Intro"
        case .labels:
            return "Labels"
        case .interactiveLabels:
            return "Interactive Labels"
        case .signup:
            return "Signup"
        case .textFieldTextInputView:
            return "Text Field Text Input View"
        case .presentAnimations:
            return "Present Animations"
        case .pushAnimations:
            return "Push Animations"
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Item.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = Item(rawValue: indexPath.item)!
        let cell = menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
        cell.titleLabel.text = itemTitle(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 20 * 2
        return CGSize(width: width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = Item(rawValue: indexPath.item)!
        displayItem(item)
    }
    
}

