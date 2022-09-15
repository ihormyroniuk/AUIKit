import UIKit

public protocol AUISwitchController: AUIControlController {

    // MARK: - UISwitch
  
    var `switch`: UISwitch? { get set }
  
    // MARK: - State
  
    var state: Bool { get }
    
    func setState(_ state: Bool, animated: Bool)
  
}
