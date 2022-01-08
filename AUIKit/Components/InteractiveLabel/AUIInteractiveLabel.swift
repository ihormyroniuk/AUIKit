//
//  InteractiveLinkLabel.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 11/29/19.
//

import UIKit

public extension NSAttributedString.Key {
    static let interaction: NSAttributedString.Key = NSAttributedString.Key("AUIKit.interaction")
}

open class AUIInteractiveLabel: AUIControl {
    
    // MARK: Subviews

    private let button: UIButton = UIButton()
    private let label: UILabel = UILabel()

    // MARK: Setup

    open override func setup() {
        super.setup()
        addSubview(label)
        addSubview(button)
        setupButton()
    }

    func setupButton() {
        button.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    }

    open var lineBreakMode: NSLineBreakMode {
        get {
            return label.lineBreakMode
        }
        set {
            label.lineBreakMode = newValue
        }
    }

    open var attributedText: NSAttributedString? {
        get {
            return label.attributedText
        }
        set {
            label.attributedText = newValue
        }
    }

    open var numberOfLines: Int {
        get {
            return label.numberOfLines
        }
        set {
            label.numberOfLines = newValue
        }
    }

    // MARK: Events

    @objc func buttonTouchUpInside(_ button: UIButton, _ event: UIEvent) {
        if let interaction = findInteractionForEvent(event) {
            let interactiveLabelEvent = AUIInteractiveLabelEvent(event: event, interaction: interaction)
            sendAllActions(.touchUpInside, interactiveLabelEvent: interactiveLabelEvent)
        }
    }
    
    // MARK: Helpers
    
    private func findInteractionForEvent(_ event: UIEvent) -> Any? {
        guard let touches = event.allTouches else { return nil }
        guard touches.count == 1 else { return nil }
        guard let touchPoint = touches.first?.location(in: self) else { return nil }
        let textContainer = NSTextContainer(size: bounds.size)
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        guard let attributedText = label.attributedText else { return nil }
        let textStorage = NSTextStorage(attributedString: attributedText)
        textStorage.addLayoutManager(layoutManager)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let alignmentOffset: CGFloat
        switch label.textAlignment {
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
        let attributeValue = self.label.attributedText?.attribute(.interaction, at: characterIndex, effectiveRange: nil)
        if let value = attributeValue {
            let range = NSRange(location: characterIndex, length: 1)
            let rect = layoutManager.boundingRect(forGlyphRange: range, in: textContainer)
            if rect.contains(touchPoint) {
                return value
            }
        }
        return nil
    }
    
    private func sendAllActions(_ event: UIControl.Event, interactiveLabelEvent: AUIInteractiveLabelEvent) {
        for target in allTargets {
            guard let actions = actions(forTarget: target, forControlEvent: event) else { continue }
            for action in actions {
                let selector = Selector(action)
                (target as NSObjectProtocol).perform(selector, with: self, with: interactiveLabelEvent)
            }
        }
    }

    // MARK: Layout

    open override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
        button.frame = bounds
    }

    // MARK: Size

    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return label.sizeThatFits(size)
    }

}
