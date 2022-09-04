import AUIKit

class IconButton: AUIButton {
    
    // MARK: Highlighted
    
    override var isHighlighted: Bool {
        willSet {
            willSetIsHighlighted(newValue)
        }
    }
    
    func willSetIsHighlighted(_ isHighlighted: Bool) {
        alpha = isHighlighted ? 0.6 : 1.0
    }
    
}
