//
//  MenuScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 09.08.2020.
//
import AUIKit

protocol MenuScreenViewControllerDelegate: AnyObject {
    func menuScreenViewControllerDisplayScrollPagesScreen(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayCurlPagesScreen(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayLabelsScreen(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayInteractiveLabelsScreen(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplaySignupScreen(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayTextFieldTextInputViewScreen(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayPresentAnimations(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayPushAnimations(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayStringsdict(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayTableView(_ menuScreenViewController: MenuScreenViewController)
}

class MenuScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Delegate
    
    weak var delegate: MenuScreenViewControllerDelegate?
    
    // MARK: Data
    
    private enum Item: Int, CaseIterable {
        case scrollPages
        case curlPages
        case labels
        case interactiveLabels
        case signup
        case textFieldTextInputView
        case presentAnimations
        case pushAnimations
        case stringsdict
        case tableView
    }
    
    // MARK: View
    
    override func loadView() {
        view = MenuScreenView()
    }
    
    private var menuScreenView: MenuScreenView! {
        return view as? MenuScreenView
    }
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        case .scrollPages:
            delegate?.menuScreenViewControllerDisplayScrollPagesScreen(self)
        case .curlPages:
            delegate?.menuScreenViewControllerDisplayCurlPagesScreen(self)
        case .labels:
            delegate?.menuScreenViewControllerDisplayLabelsScreen(self)
        case .interactiveLabels:
            delegate?.menuScreenViewControllerDisplayInteractiveLabelsScreen(self)
        case .signup:
            delegate?.menuScreenViewControllerDisplaySignupScreen(self)
        case .textFieldTextInputView:
            delegate?.menuScreenViewControllerDisplayTextFieldTextInputViewScreen(self)
        case .presentAnimations:
            delegate?.menuScreenViewControllerDisplayPresentAnimations(self)
        case .pushAnimations:
            delegate?.menuScreenViewControllerDisplayPushAnimations(self)
        case .stringsdict:
            delegate?.menuScreenViewControllerDisplayStringsdict(self)
        case .tableView:
            delegate?.menuScreenViewControllerDisplayTableView(self)
        }
    }
    
    // MARK: Content
    
    private func setContent() {
        menuScreenView.titleLabel.text = "Menu"
    }
    
    private func itemTitle(_ item: Item) -> String {
        switch item {
        case .scrollPages:
            return "Scroll Pages"
        case .curlPages:
            return "Curl Pages"
        case .labels:
            return "Labels"
        case .interactiveLabels:
            return "Interactive Labels"
        case .signup:
            return "Signup"
        case .textFieldTextInputView:
            return "Text Field Text Input View"
        case .presentAnimations:
            return "PresentAnimation"
        case .pushAnimations:
            return "PushAnimation"
        case .stringsdict:
            return "Stringsdict"
        case .tableView:
            return "TableView"
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

