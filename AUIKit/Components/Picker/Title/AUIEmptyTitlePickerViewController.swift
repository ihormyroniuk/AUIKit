import UIKit

open class AUIEmptyTitlePickerViewController: AUIEmptyPickerViewController, AUITitlePickerViewController {
  
    // MARK: - TitleComponentControllers
  
    open var titleComponentControllers: [AUITitlePickerViewComponentController] = []
  
    open override var componentControllers: [AUIPickerViewComponentController] {
        return titleComponentControllers
    }
  
    // MARK: - Setup
  
    open override func setup() {
        super.setup()
        pickerViewDelegateProxy.emptyTitlePickerViewController = self
    }
  
    // MARK: - UIPickerView
  
    open override func setupPickerView() {
        super.setupPickerView()
        pickerView?.delegate = pickerViewDelegateProxy
        pickerView?.reloadAllComponents()
    }
  
    open override func unsetupPickerView() {
        super.unsetupPickerView()
        pickerView?.delegate = nil
    }
    
    // MARK: - Loading
    
    public func loadComponents(_ componentControllers: [AUITitlePickerViewComponentController]) {
        titleComponentControllers = componentControllers
        pickerView?.reloadAllComponents()
    }
    
    // MARK: - Reloading
    
    public func reloadComponent(_ titleComponentController: AUITitlePickerViewComponentController, titleItemControllers: [AUITitlePickerViewItemController]) {
        guard let component = titleComponentControllers.firstIndex(where: { $0 === titleComponentController }) else { return }
        titleComponentController.titleItemControllers = titleItemControllers
        pickerView?.reloadComponent(component)
    }
  
    // MARK: - UIPickerViewDelegateProxyDelegate
    
    private class UIPickerViewDelegateProxy: NSObject, UIPickerViewDelegate {
        
        weak var emptyTitlePickerViewController: AUIEmptyTitlePickerViewController?
      
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return emptyTitlePickerViewController?.titleForItem(row, inComponent: component) ?? nil
        }
      
        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            return emptyTitlePickerViewController?.attributedTitleForItem(row, inComponent: component) ?? nil
        }
      
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            emptyTitlePickerViewController?.didSelectItem(row, inComponent: component)
        }
        
    }
    private let pickerViewDelegateProxy = UIPickerViewDelegateProxy()
  
    open func titleForItem(_ item: Int, inComponent component: Int) -> String? {
        return titleComponentControllers[component].titleItemControllers[item].title
    }
  
    open func attributedTitleForItem(_ item: Int, inComponent component: Int) -> NSAttributedString? {
        return titleComponentControllers[component].titleItemControllers[item].attributedTitle
    }
  
    open func didSelectItem(_ item: Int, inComponent component: Int) {
        guard component >= 0, component < titleComponentControllers.count else { return }
        let titleComponentController = titleComponentControllers[component]
        guard item >= 0, item < titleComponentController.titleItemControllers.count else { return }
        let titleItemController = titleComponentController.titleItemControllers[item]
        didSelectItemController(titleItemController, inComponentController: titleComponentController)
    }
    
}
