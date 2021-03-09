//
//  PresentAnimationTransitioningDelegate.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 25.01.2021.
//

import UIKit

class PresentAnimationTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.animator = BookingSelectTimeViewControllerAnimator(window: window)
        super.init()
    }
    
    private let animator: BookingSelectTimeViewControllerAnimator
    private let interactor = BookingSelectTimeSlotInteractor()
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private weak var vc: UIViewController?
    private var backgroundView = UIView()
    private let transitionDuration: TimeInterval = 0.6
    
    
    private class PresentAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
        
        private let window: UIWindow
        private let transitionDuration: TimeInterval
        private var backgroundView: UIView
        
        init(window: UIWindow, transitionDuration: TimeInterval, backgroundView: UIView) {
            self.window = window
            self.transitionDuration = transitionDuration
            self.backgroundView = backgroundView
            super.init()
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
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        vc = presented
        vc?.view.addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.addTarget(self, action: #selector(handleGesture))
        animator.isPresent = true
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.isPresent = false
        return animator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
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
            interactor.hasStarted = true
            vc.dismiss(animated: true, completion: nil)
        case .changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
        default:
            break
        }
    }
}
