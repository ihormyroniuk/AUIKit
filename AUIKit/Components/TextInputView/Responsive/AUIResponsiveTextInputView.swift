import UIKit

public protocol AUIResponsiveTextInputView where Self: UIView {
    func responsiveTextInputViewDidBeginEditingEmpty(animated: Bool)
    func responsiveTextInputViewDidBeginEditingNonempty(animated: Bool)
    func responsiveTextInputViewDidBecomeEmpty(animated: Bool)
    func responsiveTextInputViewDidBecomeNonEmpty(animated: Bool)
    func responsiveTextInputViewDidEndEditingEmpty(animated: Bool)
    func responsiveTextInputViewDidEndEditingNonempty(animated: Bool)
}
