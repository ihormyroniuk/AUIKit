import UIKit

public protocol AUIControlController: AUIViewController {
  
    // MARK: - UIControl
  
    var control: UIControl? { get set }
  
    // MARK: - Enabled
  
    var isEnabled: Bool { get set }
    
    // MARK: - Events
    
    var touchDown: (() -> Void)? { get set }
    
    var touchUpInside: (() -> Void)? { get set }
    
    var touchUpOutside: (() -> Void)? { get set }
    
    var valueChanged: (() -> Void)? { get set }
    
    var editingChanged: (() -> Void)? { get set }
  
}
