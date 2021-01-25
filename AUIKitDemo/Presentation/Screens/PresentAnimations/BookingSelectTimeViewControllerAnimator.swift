//
//  BookingSelectTimeViewControllerAnimator.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 25.01.2021.
//

import UIKit

class BookingSelectTimeViewControllerAnimator : NSObject {
    
    var isPresent = false
    var backgroundView = UIView()
    
    override init() {
        super.init()
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
}

extension BookingSelectTimeViewControllerAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        let screenHeightCoefficient: CGFloat = 0.85
        if isPresent {
            backgroundView.frame = UIScreen.main.bounds
            backgroundView.alpha = 0
            fromVC.view.frame = UIScreen.main.bounds
            transitionContext.containerView.insertSubview(backgroundView, aboveSubview: fromVC.view)
            transitionContext.containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
            var screenBounds = UIScreen.main.bounds
            toVC.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height,
                                     width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            screenBounds.size.height = UIScreen.main.bounds.height * screenHeightCoefficient
            let bottomLeftCorner = CGPoint(x: 0, y: UIScreen.main.bounds.height * (1 - screenHeightCoefficient))
            let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
            UIView.animate(
                withDuration: transitionDuration(using: transitionContext),
                animations: {
                    toVC.view.frame = finalFrame
                    self.backgroundView.alpha = 1
                    fromVC.view.frame = UIScreen.main.bounds
                },
                completion: { _ in
                    fromVC.view.frame = UIScreen.main.bounds
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
            )
        } else {
            backgroundView.frame = UIScreen.main.bounds
            backgroundView.alpha = 1
            var screenBounds = UIScreen.main.bounds
            screenBounds.size.height = UIScreen.main.bounds.height * screenHeightCoefficient
            let bottomLeftCorner = CGPoint(x: 0, y: UIScreen.main.bounds.height)
            let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
            UIView.animate(
                withDuration: transitionDuration(using: transitionContext),
                animations: {
                    fromVC.view.frame = finalFrame
                    self.backgroundView.alpha = 0
                },
                completion: { _ in
                    if transitionContext.transitionWasCancelled {
                        transitionContext.completeTransition(false)
                    } else {
                        self.backgroundView.removeFromSuperview()
                        transitionContext.completeTransition(true)
                    }
                }
            )
        }
    }
}
