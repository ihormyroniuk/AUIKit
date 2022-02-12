//
//  CollectionViewScreenViewController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 12.02.2022.
//

import AUIKit

protocol CollectionViewScreenViewControllerDelegate: AnyObject {
    func collectionViewScreenViewControllerBack(_ collectionViewScreenViewController: CollectionViewScreenViewController)
}

final class CollectionViewScreenViewController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: CollectionViewScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = CollectionViewScreenView()
    }
    
    private var collectionViewScreenView: CollectionViewScreenView! {
        return view as? CollectionViewScreenView
    }
    
    // MARK: Components
    
    private let collectionViewController = AUIEmptyCollectionViewController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
        setupTableViewController()
    }
    
    private func setupTableViewController() {
        collectionViewController.collectionView = collectionViewScreenView.collectionView
        collectionViewController.isPrefetchingEnabled = true
        var cellControllers: [AUICollectionViewCellController] = []
        for i in 1...100 {
            let cellController = AUIClosuresCollectionViewCellController()
            cellController.cellForItemAtIndexPathClosure = { [weak self] indexPath in
                guard let self = self else { return UICollectionViewCell() }
                let cell = self.collectionViewScreenView.collectionViewCell(indexPath)
                cell.textLabel.text = "item \(i)"
                return cell
            }
            cellController.sizeForCellClosure = { [weak self] in
                guard let self = self else { return .zero }
                return self.collectionViewScreenView.collectionViewCellSize()
            }
            cellController.willDisplayCellClosure = {
                print("willDisplayCellClosure #\(i)")
            }
            cellController.didSelectClosure = { [weak self] in
                guard let self = self else { return }
                self.collectionViewController.deleteCellControllerAnimated(cellController) { finished in
                    print("deleteCellControllerAnimated finished")
                }
            }
            cellController.didEndDisplayingCellClosure = {
                print("didEndDisplayingCellClosure #\(i)")
            }
            cellController.prefetchCellClosure = {
                print("prefetchCellClosure #\(i)")
            }
            cellController.cancelPrefetchingForCellClosure = {
                print("cancelPrefetchingForCellClosure #\(i)")
            }
            cellControllers.append(cellController)
        }
        let sectionController = AUIEmptyCollectionViewSectionController()
        sectionController.cellControllers = cellControllers
        collectionViewController.sectionControllers = [sectionController]
    }

    // MARK: Actions
    
    @objc private func back() {
        delegate?.collectionViewScreenViewControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        collectionViewScreenView.titleLabel.text = "CollectionView"
    }
    
}
