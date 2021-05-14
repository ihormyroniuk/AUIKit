//
//  PresentAnimationTransitioningDelegate.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 25.01.2021.
//

import UIKit

class PresentAnimationTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    private let window: UIWindow
    private let transitionDuration: TimeInterval = 0.6
    private let backgroundView = UIView()
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private weak var vc: UIViewController?
    
    // MARK: UIViewControllerTransitioningDelegate
    
    private class PresentAnimatedTransitioning : NSObject, UIViewControllerAnimatedTransitioning {
        
        private let window: UIWindow
        private let backgroundView: UIView
        private let transitionDuration: TimeInterval = 0.6
        
        init(window: UIWindow, backgroundView: UIView) {
            self.window = window
            self.backgroundView = backgroundView
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
        }
    }
    private lazy var presentAnimatedTransitioning: PresentAnimatedTransitioning = {
        return PresentAnimatedTransitioning(window: window, backgroundView: backgroundView)
    }()
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        vc = presented
        vc?.view.addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.addTarget(self, action: #selector(handleGesture))
        return presentAnimatedTransitioning
    }
    
    class DismissAnimatedTransitioning : NSObject, UIViewControllerAnimatedTransitioning {
        
        private let window: UIWindow
        private let backgroundView: UIView
        private let transitionDuration: TimeInterval = 0.6
        
        init(window: UIWindow, backgroundView: UIView) {
            self.window = window
            self.backgroundView = backgroundView
            super.init()
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        }
        
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return transitionDuration
        }

        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
            let screenHeightCoefficient: CGFloat = 0.85
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
    private lazy var dismissAnimatedTransitioning: DismissAnimatedTransitioning = {
        return DismissAnimatedTransitioning(window: window, backgroundView: backgroundView)
    }()
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimatedTransitioning
    }
    
    class BookingSelectTimeSlotInteractor: UIPercentDrivenInteractiveTransition {
        var hasStarted = false
        var shouldFinish = false
    }
    private lazy var interactor = BookingSelectTimeSlotInteractor()
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor
    }
    
    @objc
    func handleGesture(_ sender: UIPanGestureRecognizer) {
        guard let view = vc?.view, let vc = vc else { return }
        let percentThreshold:CGFloat = 0.3
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        switch sender.state {
        case .began:
            vc.dismiss(animated: true, completion: nil)
        case .changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.cancel()
        case .ended:
            interactor.shouldFinish ? interactor.finish() : interactor.cancel()
        default:
            break
        }
    }
}
