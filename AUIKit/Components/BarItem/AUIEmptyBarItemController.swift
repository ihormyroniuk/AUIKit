import UIKit

open class AUIEmptyBarItemController: AUIBarItemController {
  
    // MARK: - Initialization
  
    public init() {
        setup()
    }
  
    // MARK: - Setup
  
    open func setup() {
    
    }
  
    // MARK: - UIBarItem
  
    private var _barItem: UIBarItem?
    open var barItem: UIBarItem? {
        set {
            if newValue != _barItem {
                unsetupBarItem()
                _barItem = newValue
                setupBarItem()
            }
        }
        get {
            return _barItem
        }
    }
  
    open func setupBarItem() {
        barItem?.title = title
        barItem?.image = image
        barItem?.landscapeImagePhone = landscapeImagePhone
        if #available(iOS 11.0, *) { barItem?.largeContentSizeImage = largeContentSizeImage }
        barItem?.isEnabled = isEnabled
    }
  
    open func unsetupBarItem() {
        
    }
  
    // MARK: - Title
  
    open var title: String? {
        didSet { didSetTitle(oldValue: oldValue) }
    }
    open func didSetTitle(oldValue: String?) {
        barItem?.title = title
    }
  
    // MARK: - Image
  
    open var image: UIImage? {
        didSet { didSetImage(oldValue: oldValue) }
    }
    open func didSetImage(oldValue: UIImage?) {
        barItem?.image = image
    }
  
    open var landscapeImagePhone: UIImage? {
        didSet { didSetLandscapeImagePhone(oldValue: oldValue) }
    }
    open func didSetLandscapeImagePhone(oldValue: UIImage?) {
        barItem?.landscapeImagePhone = landscapeImagePhone
    }
    
    private var _largeContentSizeImage: UIImage?
    @available(iOS 11.0, *)
    open var largeContentSizeImage: UIImage? {
        get {
             return _largeContentSizeImage
        }
        set {
            let oldValue = _largeContentSizeImage
            _largeContentSizeImage = newValue
            didSetLargeContentSizeImage(oldValue: oldValue)
        }
    }
    @available(iOS 11.0, *)
    open func didSetLargeContentSizeImage(oldValue: UIImage?) {
        barItem?.largeContentSizeImage = largeContentSizeImage
    }
  
    // MARK: - Enabled
  
    open var isEnabled: Bool = true {
        didSet { didSetIsEnabled() }
    }
    open func didSetIsEnabled() {
        barItem?.isEnabled = isEnabled
    }
    
}
