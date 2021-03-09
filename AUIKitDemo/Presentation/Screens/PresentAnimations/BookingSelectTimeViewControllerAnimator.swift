//
//  BookingSelectTimeViewControllerAnimator.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 25.01.2021.
//

import UIKit

class BookingSelectTimeViewControllerAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresent = false
    var backgroundView = UIView()
    
    private let transitionDuration: TimeInterval = 0.6
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init()
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        let screenHeightCoefficient: CGFloat = 0.85
        if isPresent {
            backgroundView.frame = window.bounds
            backgroundView.alpha = 0
            fromVC.view.frame = window.bounds
            transitionContext.containerView.insertSubview(backgroundView, aboveSubview: fromVC.view)
            transitionContext.containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
            var screenBounds = window.bounds
            toVC.view.frame = CGRect(x: 0, y: window.bounds.height, width: window.bounds.width, height: window.bounds.height)
            screenBounds.size.height = window.bounds.height * screenHeightCoefficient
            let bottomLeftCorner = CGPoint(x: 0, y: window.bounds.height * (1 - screenHeightCoefficient))
            let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
            UIView.animate(withDuration: transitionDuration, animations: {
                toVC.view.frame = finalFrame
                self.backgroundView.alpha = 1
                fromVC.view.frame = self.window.bounds
            }, completion: { _ in
                fromVC.view.frame = self.window.bounds
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        } else {
            backgroundView.frame = window.bounds
            backgroundView.alpha = 1
            var screenBounds = window.bounds
            screenBounds.size.height = window.bounds.height * screenHeightCoefficient
            let bottomLeftCorner = CGPoint(x: 0, y: window.bounds.height)
            let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
            UIView.animate(withDuration: transitionDuration, animations: {
                fromVC.view.frame = finalFrame
                self.backgroundView.alpha = 0
            }, completion: { _ in
                if transitionContext.transitionWasCancelled {
                    transitionContext.completeTransition(false)
                } else {
                    self.backgroundView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                }
            })
        }
    }
}
