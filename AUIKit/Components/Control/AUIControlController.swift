import UIKit

public protocol AUIControlController: AUIViewController {
  
    // MARK: - Control
  
    var control: UIControl? { get set }
  
    // MARK: - Enabled
  
    var isEnabled: Bool { get set }
    
    // MARK: - Actions
    
    var touchDown: (() -> Void)? { get set }
    
    var touchUpInside: (() -> Void)? { get set }
    
    var touchUpOutside: (() -> Void)? { get set }
    
    var valueChanged: (() -> Void)? { get set }
    
    var editingChanged: (() -> Void)? { get set }
  
}
