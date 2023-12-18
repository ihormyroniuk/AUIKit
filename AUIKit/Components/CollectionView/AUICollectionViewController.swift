import UIKit

public protocol AUICollectionViewController: AUIScrollViewController {
    
    // MARK: - UICollectionView
  
    var collectionView: UICollectionView? { get set }
    
    // MARK: - Sections
    
    var sectionControllers: [AUICollectionViewSectionController] { get set }
    
    // MARK: - Prefetching
    
    var isPrefetchingEnabled: Bool { get }
    
    // MARK: - Scrolling
    
    func scrollToCellController(_ cellController: AUICollectionViewCellController, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool)
    
    // MARK: - Reloading
    
    func reloadSection(_ sectionController: AUICollectionViewSectionController, cellControllers: [AUICollectionViewCellController])
    
    func reloadSectionAnimated(_ sectionController: AUICollectionViewSectionController, cellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?)
    
    func reloadCellController(_ cellController: AUICollectionViewCellController)
    
    func reloadCellControllerAnimated(_ cellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?)
    
    // MARK: - Inserting
    
    func insertSectionAtBeginning(_ insertingSectionController: AUICollectionViewSectionController)
    
    func insertSectionAtBeginningAnimated(_ insertingSectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    func insertSectionsAtBeginning(_ insertingSectionControllers: [AUICollectionViewSectionController])
    
    func insertSectionsAtBeginningAnimated(_ insertingSectionControllers: [AUICollectionViewSectionController], completion: ((Bool) -> Void)?)
    
    func appendSectionControllers(_ sectionControllers: [AUICollectionViewSectionController], completion: ((Bool) -> Void)?)
    func appendSectionController(_ sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    func appendCellControllers(_ cellControllers: [AUICollectionViewCellController], toSectionController sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    func appendCellController(_ cellController: AUICollectionViewCellController, toSectionController sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    // MARK: - Deleting
    
    func deleteCellController(_ deletingCellController: AUICollectionViewCellController)
    
    func deleteCellControllerAnimated(_ deletingCellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?)
    
    func deleteCellControllers(_ deletingCellControllers: [AUICollectionViewCellController])
    
    func deleteCellControllersAnimated(_ deletingCellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?)
    
    // MARK: - Moving
    
    func moveItem(at atIndexPath: IndexPath, to toIndexPath: IndexPath, completion: ((Bool) -> Void)?)
    
}
