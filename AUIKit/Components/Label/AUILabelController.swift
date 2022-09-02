import Foundation
import UIKit

public protocol AUILabelController: AUIViewController {
  
    // MARK: - UILabel
    
    var label: UILabel? { get set }
  
    // MARK: - Text
  
    var text: String? { get set }
  
}
