import UIKit

public protocol AUISwitchController: AUIControlController {

    // MARK: - Switch
  
    var `switch`: UISwitch? { get set }
  
    // MARK: State
  
    var state: Bool { get set }
  
}
