import UIKit
import UniformTypeIdentifiers

open class AUIClosuresImagePickerController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Initialization
    
    public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        delegate = self
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        delegate = self
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        delegate = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    private var _didFinishPickingMediaWithInfo: (([UIImagePickerController.InfoKey : Any]) -> Void)?
    @available(iOS 2.0, *)
    open var didFinishPickingMediaWithInfo: (([UIImagePickerController.InfoKey : Any]) -> Void)? {
        get { _didFinishPickingMediaWithInfo  }
        set { _didFinishPickingMediaWithInfo = newValue }
    }
    @available(iOS 2.0, *)
    open func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let didFinishPickingMediaWithInfo = didFinishPickingMediaWithInfo else { return }
        didFinishPickingMediaWithInfo(info)
    }

    private var _didCancel: (() -> Void)?
    @available(iOS 2.0, *)
    open var didCancel: (() -> Void)? {
        get { _didCancel  }
        set { _didCancel = newValue }
    }
    @available(iOS 2.0, *)
    open func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        guard let didCancel = didCancel else { return }
        didCancel()
    }
    
}
