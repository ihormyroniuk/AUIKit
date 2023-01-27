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
        collectionViewController.didScroll = {
            print("ggggg")
        }
        collectionViewController.collectionView = collectionViewScreenView.collectionView
        collectionViewController.isPrefetchingEnabled = true
        var cellControllers: [AUICollectionViewCellController] = []
        for i in 1...100 {
            let cellController = CollectionViewCellController(i: i)
            cellController.sizeForCellClosure = { [weak self] in
                guard let self = self else { return .zero }
                return self.collectionViewScreenView.collectionViewCellSize()
            }
            cellController.willDisplay = {
                print("willDisplayCellClosure #\(i)")
            }
            cellController.didSelect = { [weak self] in
                guard let self = self else { return }
//                self.collectionViewController.deleteCellController(cellController) { finished in
//                    print("deleteCellControllerAnimated finished")
//                }
                self.collectionViewController.scrollToCellController(cellController, at: .centeredVertically, animated: true)
            }
            cellController.didEndDisplaying = {
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
        //collectionViewController.sectionControllers = [sectionController]
        collectionViewController.appendSectionController(sectionController, completion: nil)
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
