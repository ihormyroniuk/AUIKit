import UIKit

open class AUIEmptyToolbarController: AUIEmptyViewController, AUIToolbarController {

    // MARK: - UIToolbar
  
    open var toolbar: UIToolbar? {
        set { view = newValue }
        get { return view as? UIToolbar }
    }
  
}
