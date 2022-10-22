import UIKit

open class AUIEmptyViewPickerViewController: AUIEmptyPickerViewController, AUIViewPickerViewController {
  
    // MARK: Delegates
  
    private let pickerViewDelegateProxy = UIPickerViewDelegateProxy()
  
    // MARK: Component Controllers
  
    open var viewComponentControllers: [AUIViewPickerViewComponentController] = []
  
    open override var componentControllers: [AUIPickerViewComponentController] {
        return viewComponentControllers
    }
  
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        pickerViewDelegateProxy.emptyViewPickerViewController = self
    }
  
    // MARK: UIPickerView
  
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
    
    open func loadViewComponentControllers(_ viewComponentControllers: [AUIViewPickerViewComponentController]) {
        self.viewComponentControllers = viewComponentControllers
        pickerView?.reloadAllComponents()
    }
    
    // MARK: - Reloading
    
    open func reloadViewComponentController(_ viewComponentController: AUIViewPickerViewComponentController, viewItemControllers: [AUIViewPickerViewItemController]) {
        guard let component = viewComponentControllers.firstIndex(where: { $0 === viewComponentController }) else { return }
        viewComponentController.viewItemControllers = viewItemControllers
        pickerView?.reloadComponent(component)
    }
  
    // MARK: UIPickerViewDelegateProxyDelegate
    
    private class UIPickerViewDelegateProxy: NSObject, UIPickerViewDelegate {
        
        weak var emptyViewPickerViewController: AUIEmptyViewPickerViewController?
      
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            return emptyViewPickerViewController?.viewForItem(row, inComponent: component, reusingView: view) ?? UIView()
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return emptyViewPickerViewController?.widthForComponent(component) ?? 0
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return emptyViewPickerViewController?.heightForComponent(component) ?? 0
        }
      
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            emptyViewPickerViewController?.didSelectItem(row, inComponent: component)
        }
        
    }
  
    open func viewForItem(_ item: Int, inComponent component: Int, reusingView view: UIView?) -> UIView {
        guard component >= 0, component < componentControllers.count else { return UIView() }
        let componentController = viewComponentControllers[component]
        guard item >= 0, item < componentController.itemControllers.count else { return UIView() }
        let itemController = componentController.viewItemControllers[item]
        return itemController.view(reusingView: view)
    }
    
    open func widthForComponent(_ component: Int) -> CGFloat {
        guard component >= 0, component < viewComponentControllers.count else { return 0 }
        return viewComponentControllers[component].width
    }
    
    open func heightForComponent(_ component: Int) -> CGFloat {
        guard component >= 0, component < viewComponentControllers.count else { return 0 }
        return viewComponentControllers[component].height
    }
  
    open func didSelectItem(_ item: Int, inComponent component: Int) {
        guard component >= 0, component < viewComponentControllers.count else { return }
        let componentController = componentControllers[component]
        guard item >= 0, item < componentController.itemControllers.count else { return }
        let itemController = componentController.itemControllers[item]
        didSelectItemController(itemController, inComponentController: componentController)
    }
}
