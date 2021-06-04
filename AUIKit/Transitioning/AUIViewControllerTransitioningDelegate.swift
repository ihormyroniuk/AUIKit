//
//  AUIViewControllerTransitioningDelegate.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 31.05.2021.
//

import UIKit

protocol PresentAnimatedTransitioningDelegate: AnyObject {
    func presentTransitionDuration(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController, using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    func presentAnimateTransition(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController, using transitionContext: UIViewControllerContextTransitioning)
}
open class PresentAnimatedTransitioning : NSObject, UIViewControllerAnimatedTransitioning {
    
    let presentedViewController: UIViewController
    let presentingViewController: UIViewController
    let sourceViewController: UIViewController
    
    init(presentedViewController: UIViewController, presentingViewController: UIViewController, sourceViewController: UIViewController) {
        self.presentedViewController = presentedViewController
        self.presentingViewController = presentingViewController
        self.sourceViewController = sourceViewController
    }
    
    weak var delegate: PresentAnimatedTransitioningDelegate?
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return delegate?.presentTransitionDuration(forPresented: presentedViewController, presenting: presentingViewController, source: sourceViewController, using: transitionContext) ?? 0
    }

    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        delegate?.presentAnimateTransition(forPresented: presentedViewController, presenting: presentingViewController, source: sourceViewController, using: transitionContext)
    }
}

protocol DismissAnimatedTransitioningDelegate: AnyObject {
    func dismissTransitionDuration(forDismissed dismissed: UIViewController, using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    func dismissAnimateTransition(forDismissed dismissed: UIViewController, using transitionContext: UIViewControllerContextTransitioning)
}
open class DismissAnimatedTransitioning : NSObject, UIViewControllerAnimatedTransitioning {
    
    let dismissedViewController: UIViewController
    
    init(dismissedViewController: UIViewController) {
        self.dismissedViewController = dismissedViewController
    }
    
    weak var delegate: DismissAnimatedTransitioningDelegate?
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return delegate?.dismissTransitionDuration(forDismissed: dismissedViewController, using: transitionContext) ?? 0
    }

    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        delegate?.dismissAnimateTransition(forDismissed: dismissedViewController, using: transitionContext)
    }
}

open class AUIViewControllerTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate, PresentAnimatedTransitioningDelegate, DismissAnimatedTransitioningDelegate {
    
    open func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let presentAnimatedTransitioning = PresentAnimatedTransitioning(presentedViewController: presented, presentingViewController: presenting, sourceViewController: source)
        presentAnimatedTransitioning.delegate = self
        return presentAnimatedTransitioning
    }
    
    open func presentTransitionDuration(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController, using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0
    }
    
    open func presentAnimateTransition(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController, using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    open func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let dismissAnimatedTransitioning = DismissAnimatedTransitioning(dismissedViewController: dismissed)
        dismissAnimatedTransitioning.delegate = self
        return dismissAnimatedTransitioning
    }
    
    open func dismissTransitionDuration(forDismissed dismissed: UIViewController, using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0
    }
    
    open func dismissAnimateTransition(forDismissed dismissed: UIViewController, using transitionContext: UIViewControllerContextTransitioning) {
        
    }

    open func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }

    
    open func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }

    open func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return nil
    }
    
}
