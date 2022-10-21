import UIKit

public protocol AUIPickerViewController: AUIViewController {
    
    // MARK: - UIPickerView
  
    var pickerView: UIPickerView? { get set }

    // MARK: - ComponentControllers
  
    var componentControllers: [AUIPickerViewComponentController] { get }
  
    // MARK: - Selection
  
    func selectItemController(_ itemController: AUIPickerViewItemController, atComponentController componentController: AUIPickerViewComponentController, animated: Bool)
  
    func selectedItemController(atComponentController componentController: AUIPickerViewComponentController) -> AUIPickerViewItemController?
    
}
