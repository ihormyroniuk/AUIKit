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
    func menuScreenViewControllerDisplayTableView(_ menuScreenViewController: MenuScreenViewController)
}

class MenuScreenViewController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: MenuScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = MenuScreenView()
    }
    
    private var menuScreenView: MenuScreenView! {
        return view as? MenuScreenView
    }
    
    // MARK: Componets
    
    let collectionViewController = AUIEmptyCollectionViewController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setContent()
    }

    private func setupCollectionView() {
        collectionViewController.collectionView = menuScreenView.collectionView
        let sectionController = AUIEmptyCollectionViewSectionController()
        var cellControllers: [AUICollectionViewCellController] = []
        // Scroll Pages
        let scrollPagesCellController = AUIClosuresCollectionViewCellController()
        scrollPagesCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Scroll Pages"
            return cell
        }
        scrollPagesCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayScrollPagesScreen(self)
        }
        cellControllers.append(scrollPagesCellController)
        // Curl Pages
        let curlPagesCellController = AUIClosuresCollectionViewCellController()
        curlPagesCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Curl Pages"
            return cell
        }
        curlPagesCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayCurlPagesScreen(self)
        }
        cellControllers.append(curlPagesCellController)
        // Labels
        let labelsCellController = AUIClosuresCollectionViewCellController()
        labelsCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Labels"
            return cell
        }
        labelsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayLabelsScreen(self)
        }
        cellControllers.append(labelsCellController)
        // Interactive Labels
        let interactiveLabelsCellController = AUIClosuresCollectionViewCellController()
        interactiveLabelsCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Interactive Labels"
            return cell
        }
        interactiveLabelsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayInteractiveLabelsScreen(self)
        }
        cellControllers.append(interactiveLabelsCellController)
        // Signup
        let signupCellController = AUIClosuresCollectionViewCellController()
        signupCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Signup"
            return cell
        }
        signupCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplaySignupScreen(self)
        }
        cellControllers.append(signupCellController)
        // Text Field Text Input View
        let textFieldTextInputViewCellController = AUIClosuresCollectionViewCellController()
        textFieldTextInputViewCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Text Field Text Input View"
            return cell
        }
        textFieldTextInputViewCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayTextFieldTextInputViewScreen(self)
        }
        cellControllers.append(textFieldTextInputViewCellController)
        // Present Animations
        let presentAnimationsCellController = AUIClosuresCollectionViewCellController()
        presentAnimationsCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Present Animations"
            return cell
        }
        presentAnimationsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayPresentAnimations(self)
        }
        cellControllers.append(presentAnimationsCellController)
        // Push Animations
        let pushAnimationsCellController = AUIClosuresCollectionViewCellController()
        pushAnimationsCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Push Animations"
            return cell
        }
        pushAnimationsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayPushAnimations(self)
        }
        cellControllers.append(pushAnimationsCellController)
        // Table View
        let tableViewCellController = AUIClosuresCollectionViewCellController()
        tableViewCellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = self.menuScreenView.menuItemCollectionViewCell(indexPath: indexPath)
            cell.titleLabel.text = "Table View"
            return cell
        }
        tableViewCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayTableView(self)
        }
        cellControllers.append(tableViewCellController)
        sectionController.cellControllers = cellControllers
        collectionViewController.sectionControllers = [sectionController]
    }

    // MARK: Content
    
    private func setContent() {
        menuScreenView.titleLabel.text = "Menu"
    }
    
}

