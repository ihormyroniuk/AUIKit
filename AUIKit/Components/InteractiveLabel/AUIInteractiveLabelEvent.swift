import UIKit

open class AUIInteractiveLabelEvent: UIEvent {
    
    public let event: UIEvent
    public let interaction: Any
    
    // MARK: Initialization
    
    public init(event: UIEvent, interaction: Any) {
        self.event = event
        self.interaction = interaction
        super.init()
    }
    
    // MARK: - UIEvent
    
    @available(iOS 3.0, *)
    open override var type: UIEvent.EventType {
        return event.type
    }

    @available(iOS 3.0, *)
    open override var subtype: UIEvent.EventSubtype {
        return event.subtype
    }

    open override var timestamp: TimeInterval {
        return event.timestamp
    }

    @available(iOS 13.4, *)
    open override var modifierFlags: UIKeyModifierFlags {
        return event.modifierFlags
    }

    @available(iOS 13.4, *)
    open override var buttonMask: UIEvent.ButtonMask {
        return event.buttonMask
    }

    
    open override var allTouches: Set<UITouch>? {
        return  event.allTouches
    }

    open override func touches(for window: UIWindow) -> Set<UITouch>? {
        return event.touches(for: window)
    }

    open override func touches(for view: UIView) -> Set<UITouch>? {
        return event.touches(for: view)
    }

    @available(iOS 3.2, *)
    open override func touches(for gesture: UIGestureRecognizer) -> Set<UITouch>? {
        return event.touches(for: gesture)
    }

    @available(iOS 9.0, *)
    open override func coalescedTouches(for touch: UITouch) -> [UITouch]? {
        return event.coalescedTouches(for: touch)
    }

    @available(iOS 9.0, *)
    open override func predictedTouches(for touch: UITouch) -> [UITouch]? {
        return event.predictedTouches(for: touch)
    }
    
}
