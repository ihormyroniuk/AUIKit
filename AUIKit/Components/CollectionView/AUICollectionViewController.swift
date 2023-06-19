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
    
    // MARK: - Inserting
    
    func appendSectionControllers(_ sectionControllers: [AUICollectionViewSectionController], completion: ((Bool) -> Void)?)
    func appendSectionController(_ sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    func appendCellControllers(_ cellControllers: [AUICollectionViewCellController], toSectionController sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    func appendCellController(_ cellController: AUICollectionViewCellController, toSectionController sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    // MARK: - Deleting
    
    func deleteCellController(_ cellController: AUICollectionViewCellController)
    
    func deleteCellControllerAnimated(_ cellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?)
    
    func deleteCellControllers(_ cellControllers: [AUICollectionViewCellController])
    
    func deleteCellControllersAnimated(_ cellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?)
    
    // MARK: - Moving
    
    func moveItem(at atIndexPath: IndexPath, to toIndexPath: IndexPath, completion: ((Bool) -> Void)?)
    
}
