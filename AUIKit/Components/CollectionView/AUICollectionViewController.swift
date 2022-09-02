import UIKit

public protocol AUICollectionViewController: AUIScrollViewController {
    
    // MARK: UICollectionView
  
    var collectionView: UICollectionView? { get set }
    
    // MARK: Sections
    
    var sectionControllers: [AUICollectionViewSectionController] { get set }
    
    // MARK: Modification
    
    func deleteCellControllers(_ cellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?)
    func deleteCellController(_ cellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?)
    
    func appendSectionControllers(_ sectionControllers: [AUICollectionViewSectionController], completion: ((Bool) -> Void)?)
    func appendSectionController(_ sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    func appendCellControllers(_ cellControllers: [AUICollectionViewCellController], toSectionController sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    func appendCellController(_ cellController: AUICollectionViewCellController, toSectionController sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?)
    
    func moveItem(at atIndexPath: IndexPath, to toIndexPath: IndexPath, completion: ((Bool) -> Void)?)
    
    // MARK: Reloading
    
    func deleteCellControllerReload(_ cellController: AUICollectionViewCellController)
    func deleteCellControllersReload(_ cellControllers: [AUICollectionViewCellController])
    
    // MARK: Prefetching
    
    var isPrefetchingEnabled: Bool { get }
    
}
