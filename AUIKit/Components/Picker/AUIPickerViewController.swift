import UIKit

public protocol AUIPickerViewController: AUIViewController {
    
    // MARK: - UIPickerView
  
    var pickerView: UIPickerView? { get set }

    // MARK: - Components
  
    var componentControllers: [AUIPickerViewComponentController] { get }
  
    // MARK: - Select
  
    func selectItemController(_ itemController: AUIPickerViewItemController, atComponentController componentController: AUIPickerViewComponentController, animated: Bool)
  
    func selectedItemController(atComponentController componentController: AUIPickerViewComponentController) -> AUIPickerViewItemController?
    
}
