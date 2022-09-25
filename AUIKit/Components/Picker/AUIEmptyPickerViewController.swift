import UIKit

open class AUIEmptyPickerViewController: AUIEmptyViewController, AUIPickerViewController {
    
    // MARK: - Components
  
    open var componentControllers: [AUIPickerViewComponentController] {
        return []
    }
    open func didSetComponentControllers(_ oldValue: [AUIPickerViewComponentController]) {
        pickerView?.reloadAllComponents()
        let oldSelectedItemControllers = selectedItemControllers
        selectedItemControllers = [:]
        for componentController in componentControllers {
            let componentControllerHashableContainer = AUIPickerViewComponentControllerHashableContainer(componentController)
            if let selectedItemController = oldSelectedItemControllers[componentControllerHashableContainer] {
                selectItemController(selectedItemController, atComponentController: componentController, animated: false)
            } else if let firstItemController = componentController.itemControllers.first {
                selectItemController(firstItemController, atComponentController: componentController, animated: false)
            }
        }
    }
    
    // MARK: - Setup
  
    open override func setup() {
        super.setup()
        pickerViewDataSourceProxy.delegate = self
    }
    
    // MARK: - UIPickerView
  
    open var pickerView: UIPickerView? {
        set { view = newValue }
        get { return view as? UIPickerView }
    }
  
    open override func setupView() {
        super.setupView()
        setupPickerView()
    }
    
    open func setupPickerView() {
        pickerView?.dataSource = pickerViewDataSourceProxy
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupPickerView()
    }
    
    open func unsetupPickerView() {
        super.unsetupView()
        pickerView?.dataSource = nil
    }
  
    // MARK: Select ItemController
    
    private var selectedItemControllers: [AUIPickerViewComponentControllerHashableContainer: AUIPickerViewItemController] = [:]
    
    open func selectItemController(_ itemController: AUIPickerViewItemController, atComponentController componentController: AUIPickerViewComponentController, animated: Bool) {
        let componentControllerHashableContainer = AUIPickerViewComponentControllerHashableContainer(componentController)
        selectedItemControllers[componentControllerHashableContainer] = itemController
        guard let component = componentControllers.firstIndex(where: { $0 === componentController }) else { return }
        guard let item = componentController.itemControllers.firstIndex(where: { $0 === itemController }) else { return }
        pickerView?.selectRow(item, inComponent: component, animated: animated)
    }
  
    open func selectedItemController(atComponentController componentController: AUIPickerViewComponentController) -> AUIPickerViewItemController? {
        let componentControllerHashableContainer = AUIPickerViewComponentControllerHashableContainer(componentController)
        guard let itemController = selectedItemControllers[componentControllerHashableContainer] else { return nil }
        return itemController
    }
    
    open func didSelectItemController(_ itemController: AUIPickerViewItemController, inComponentController componentController: AUIPickerViewComponentController) {
        let componentControllerHashableContainer = AUIPickerViewComponentControllerHashableContainer(componentController)
        selectedItemControllers[componentControllerHashableContainer] = itemController
        itemController.didSelect()
    }
    
    // MARK: - UIPickerViewDataSourceProxy
    
    private class UIPickerViewDataSourceProxy: NSObject, UIPickerViewDataSource {
        
        weak var delegate: AUIEmptyPickerViewController?
      
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return delegate?.numberOfComponents() ?? 0
        }
      
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return delegate?.numberOfItemsInComponent(component) ?? 0
        }
        
    }
  
    private let pickerViewDataSourceProxy = UIPickerViewDataSourceProxy()
    
    open func numberOfComponents() -> Int {
        return componentControllers.count
    }
  
    open func numberOfItemsInComponent(_ component: Int) -> Int {
        return componentControllers[component].itemControllers.count
    }
    
}
            
private class AUIPickerViewComponentControllerHashableContainer: Hashable {
    
    private let componentController: AUIPickerViewComponentController
    private let objectIdentifier: ObjectIdentifier
    
    init(_ componentController: AUIPickerViewComponentController) {
        self.componentController = componentController
        self.objectIdentifier = ObjectIdentifier(componentController)
    }
    
    static func == (lhs: AUIPickerViewComponentControllerHashableContainer, rhs: AUIPickerViewComponentControllerHashableContainer) -> Bool {
        return lhs.objectIdentifier == rhs.objectIdentifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(objectIdentifier)
    }
    
}
