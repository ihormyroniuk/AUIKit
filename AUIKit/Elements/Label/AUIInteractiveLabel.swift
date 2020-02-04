//
//  InteractiveLinkLabel.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 11/29/19.
//

import UIKit

public extension NSAttributedString.Key {
    static let interaction: NSAttributedString.Key = NSAttributedString.Key("interaction")
}

open class AUIInteractiveLabel: AUILabel {

    // MARK: Setup

    open override func setup() {
        super.setup()
        isUserInteractionEnabled = true
    }

    // MARK: Events

    private let control = UIControl()

    open func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        control.addTarget(target, action: action, for: controlEvents)
    }

    open func removeTarget(_ target: Any?, action: Selector?, for controlEvents: UIControl.Event) {
        control.removeTarget(target, action: action, for: controlEvents)
    }

    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard touches.count == 1 else { return }
        guard let touchPoint = touches.first?.location(in: self) else { return }
        let textContainer = NSTextContainer(size: bounds.size)
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = lineBreakMode
        textContainer.maximumNumberOfLines = numberOfLines
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        guard let attributedText = attributedText else {return }
        let textStorage = NSTextStorage(attributedString: attributedText)
        textStorage.addLayoutManager(layoutManager)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        var alignmentOffset: CGFloat!
        switch textAlignment {
        case .left, .natural, .justified:
            alignmentOffset = 0.0
        case .center:
            alignmentOffset = 0.5
        case .right:
            alignmentOffset = 1.0
        @unknown default:
            alignmentOffset = 0.0
        }
        let xOffset = (bounds.size.width - textBoundingBox.size.width) * alignmentOffset - textBoundingBox.origin.x
        let yOffset = (bounds.size.height - textBoundingBox.size.height) * alignmentOffset - textBoundingBox.origin.y
        let locationOfTouchInTextContainer = CGPoint(x: touchPoint.x - xOffset, y: touchPoint.y - yOffset)
        let characterIndex = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        let attributeValue = self.attributedText?.attribute(NSAttributedString.Key.interaction, at: characterIndex, effectiveRange: nil)
        if let value = attributeValue {
            let range = NSRange(location: characterIndex, length: 1)
            let rect = layoutManager.boundingRect(forGlyphRange: range, in: textContainer)
            if rect.contains(touchPoint) {
                let event = UIControl.Event.touchUpInside
                let targets = control.allTargets
                for target in targets {
                    guard let actions = control.actions(forTarget: target, forControlEvent: event) else { continue }
                    for action in actions {
                        Thread.detachNewThreadSelector(Selector(action), toTarget: target, with: value)
                    }
                }
            }
        }
    }

    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let touchPoint = point
        let textContainer = NSTextContainer(size: bounds.size)
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = lineBreakMode
        textContainer.maximumNumberOfLines = numberOfLines
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        guard let attributedText = attributedText else { return false }
        let textStorage = NSTextStorage(attributedString: attributedText)
        textStorage.addLayoutManager(layoutManager)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        var alignmentOffset: CGFloat!
        switch textAlignment {
        case .left, .natural, .justified:
            alignmentOffset = 0.0
        case .center:
            alignmentOffset = 0.5
        case .right:
            alignmentOffset = 1.0
        @unknown default:
            alignmentOffset = 0.0
        }
        let xOffset = (bounds.size.width - textBoundingBox.size.width) * alignmentOffset - textBoundingBox.origin.x
        let yOffset = (bounds.size.height - textBoundingBox.size.height) * alignmentOffset - textBoundingBox.origin.y
        let locationOfTouchInTextContainer = CGPoint(x: touchPoint.x - xOffset, y: touchPoint.y - yOffset)
        let characterIndex = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        let attributeValue = self.attributedText?.attribute(NSAttributedString.Key.interaction, at: characterIndex, effectiveRange: nil)
        if attributeValue != nil {
            let range = NSRange(location: characterIndex, length: 1)
            let rect = layoutManager.boundingRect(forGlyphRange: range, in: textContainer)
            if rect.contains(touchPoint) {
                return true
            }
        }
        return false
    }

}
