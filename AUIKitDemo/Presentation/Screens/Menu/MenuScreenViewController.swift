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
    func menuScreenViewControllerDisplayCollectionView(_ menuScreenViewController: MenuScreenViewController)
    func menuScreenViewControllerDisplayPickerViews(_ menuScreenViewController: MenuScreenViewController)
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
        let scrollPagesCellController = MenuItemCollectionViewCellController(title: "Scroll Pages")
        scrollPagesCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayScrollPagesScreen(self)
        }
        scrollPagesCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(scrollPagesCellController)
        // Curl Pages
        let curlPagesCellController = MenuItemCollectionViewCellController(title: "Curl Pages")
        curlPagesCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayCurlPagesScreen(self)
        }
        curlPagesCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(curlPagesCellController)
        // Labels
        let labelsCellController = MenuItemCollectionViewCellController(title: "Labels")
        labelsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayLabelsScreen(self)
        }
        labelsCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(labelsCellController)
        // Interactive Labels
        let interactiveLabelsCellController = MenuItemCollectionViewCellController(title: "Interactive Labels")
        interactiveLabelsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayInteractiveLabelsScreen(self)
        }
        interactiveLabelsCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(interactiveLabelsCellController)
        // Signup
        let signupCellController = MenuItemCollectionViewCellController(title: "Signup")
        signupCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplaySignupScreen(self)
        }
        signupCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(signupCellController)
        // Text Field Text Input View
        let textFieldTextInputViewCellController = MenuItemCollectionViewCellController(title: "Text Field Text Input View")
        textFieldTextInputViewCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayTextFieldTextInputViewScreen(self)
        }
        textFieldTextInputViewCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(textFieldTextInputViewCellController)
        // Present Animations
        let presentAnimationsCellController = MenuItemCollectionViewCellController(title: "Present Animations")
        presentAnimationsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayPresentAnimations(self)
        }
        presentAnimationsCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(presentAnimationsCellController)
        // Push Animations
        let pushAnimationsCellController = MenuItemCollectionViewCellController(title: "Push Animations")
        pushAnimationsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayPushAnimations(self)
        }
        pushAnimationsCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(pushAnimationsCellController)
        // Table View
        let tableViewCellController = MenuItemCollectionViewCellController(title: "Table View")
        tableViewCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayTableView(self)
        }
        tableViewCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(tableViewCellController)
        // Collection View
        let collectionViewCellController = MenuItemCollectionViewCellController(title: "Collection View")
        collectionViewCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayCollectionView(self)
        }
        collectionViewCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(collectionViewCellController)
        // Pickers
        let pickerViewsCellController = MenuItemCollectionViewCellController(title: "PickerViews")
        pickerViewsCellController.didSelectClosure = { [weak self] in
            guard let self = self else { return }
            self.delegate?.menuScreenViewControllerDisplayPickerViews(self)
        }
        pickerViewsCellController.sizeForCellClosure = { [weak self] in
            guard let self = self else { return .zero }
            return self.menuScreenView.menuItemCollectionViewCellSize()
        }
        cellControllers.append(pickerViewsCellController)
        sectionController.cellControllers = cellControllers
        collectionViewController.sectionControllers = [sectionController]
    }

    // MARK: Content
    
    private func setContent() {
        menuScreenView.titleLabel.text = "Menu"
    }
    
}

