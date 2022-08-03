//
//  File.swift
//  
//
//  Created by Job Ihor Myroniuk on 19.07.2022.
//

import UIKit

class TopAlertViewControllerTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    private let window: UIWindow
    private let backgroundView = UIView()
    private let backgroundViewTapGestureRecognizer = UITapGestureRecognizer()
    private weak var presentedViewController: UIViewController?
    private weak var presentingViewController: UIViewController?
    private let presentedViewControllerPanGestureRecognizer = UIPanGestureRecognizer()
    
    // MARK: - Initialization
    
    @objc init(window: UIWindow) {
        self.window = window
        super.init()
        backgroundView.addGestureRecognizer(backgroundViewTapGestureRecognizer)
        backgroundViewTapGestureRecognizer.addTarget(self, action: #selector(backgroundViewTapGestureRecognizerAction))
    }
    
    // MARK: - Events
    
    @objc func backgroundViewTapGestureRecognizerAction() {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Presentation
    
    private class PresentAnimatedTransitioning : NSObject, UIViewControllerAnimatedTransitioning {
        
        private let window: UIWindow
        private let backgroundView: UIView
        private let transitionDuration: TimeInterval = 0.25
        
        init(window: UIWindow, backgroundView: UIView) {
            self.window = window
            self.backgroundView = backgroundView
            super.init()
        }
        
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return transitionDuration
        }

        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
            let containerView = transitionContext.containerView
            containerView.addSubview(backgroundView)
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            backgroundView.alpha = 0
            backgroundView.frame = window.bounds
            containerView.addSubview(toViewController.view)
            var toViewControllerSize = toViewController.view.sizeThatFits(window.bounds.size)
            toViewControllerSize.height += window.safeAreaInsets.top
            let initialToViewControllerFrameOrigin = CGPoint(x: 0, y: -toViewControllerSize.height)
            toViewController.view.frame = CGRect(origin: initialToViewControllerFrameOrigin, size: toViewControllerSize)
            let finalToViewControllerFrameOrigin = CGPoint(x: 0, y: 0)
            let finalToViewControllerFrame = CGRect(origin: finalToViewControllerFrameOrigin, size: toViewControllerSize)
            UIView.animate(withDuration: transitionDuration, animations: { [weak self] in
                guard let self = self else { return }
                toViewController.view.frame = finalToViewControllerFrame
                self.backgroundView.alpha = 1
            }, completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
    
    private lazy var presentAnimatedTransitioning: PresentAnimatedTransitioning = {
        return PresentAnimatedTransitioning(window: window, backgroundView: backgroundView)
    }()
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentedViewController = presented
        presentingViewController = presenting
        presentedViewController?.view.addGestureRecognizer(presentedViewControllerPanGestureRecognizer)
        presentedViewControllerPanGestureRecognizer.addTarget(self, action: #selector(presentedViewControllerPanGestureRecognizerAction))
        return presentAnimatedTransitioning
    }
    
    // MARK: - Dismission
    
    private class DismissAnimatedTransitioning : NSObject, UIViewControllerAnimatedTransitioning {
        
        private let window: UIWindow
        private let backgroundView: UIView
        private let transitionDuration: TimeInterval = 0.25
        
        init(window: UIWindow, backgroundView: UIView) {
            self.window = window
            self.backgroundView = backgroundView
            super.init()
        }
        
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return transitionDuration
        }

        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
            let fromViewControllerSize = fromViewController.view.bounds.size
            let finalFromViewControllerFrameOrigin = CGPoint(x: 0, y: -fromViewControllerSize.height)
            let finalFromViewControllerFrame = CGRect(origin: finalFromViewControllerFrameOrigin, size: fromViewControllerSize)
            UIView.animate(withDuration: transitionDuration, animations: { [weak self] in
                guard let self = self else { return }
                fromViewController.view.frame = finalFromViewControllerFrame
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
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimatedTransitioning
    }
    
    // MARK: - Interaction
    
    private var interactionHasStarted = false
    
    private lazy var interactor: UIPercentDrivenInteractiveTransition = {
        let percentDrivenInteractiveTransition = UIPercentDrivenInteractiveTransition()
        return percentDrivenInteractiveTransition
    }()
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionHasStarted ? interactor : nil
    }
    
    @objc
    func presentedViewControllerPanGestureRecognizerAction(_ sender: UIPanGestureRecognizer) {
        guard let viewController = presentedViewController else { return }
        guard let view = viewController.view else { return }
        let percentThreshold: CGFloat = 0.3
        let translation = sender.translation(in: view)
        let verticalMovement = -translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        switch sender.state {
        case .began:
            interactionHasStarted = true
            viewController.dismiss(animated: true, completion: nil)
        case .changed:
            interactor.update(progress)
        case .cancelled:
            interactionHasStarted = false
            interactor.cancel()
        case .ended:
            interactionHasStarted = false
            progress > percentThreshold ? interactor.finish() : interactor.cancel()
        default:
            break
        }
    }
}
