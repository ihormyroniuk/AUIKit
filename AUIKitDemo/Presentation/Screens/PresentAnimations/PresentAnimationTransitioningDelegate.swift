//
//  PresentAnimationTransitioningDelegate.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 25.01.2021.
//

import AUIKit

class PresentAnimationTransitioningDelegate: AUIViewControllerTransitioningDelegate {
    
    private let window: UIWindow
    private let backgroundView = UIView()
    private let transitionDuration: TimeInterval = 0.6

    init(window: UIWindow) {
        self.window = window
        super.init()
        backgroundView.addGestureRecognizer(backgroundViewTapGestureRecognizer)
        backgroundViewTapGestureRecognizer.addTarget(self, action: #selector(tapAction))
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    private let backgroundViewTapGestureRecognizer = UITapGestureRecognizer()
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private weak var presentedViewController: UIViewController?
    
    @objc func tapAction() {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentedViewController = presented
        presentedViewController?.view.addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.addTarget(self, action: #selector(handleGesture))
        return super.animationController(forPresented: presented, presenting: presenting, source: source)
    }
    
    override func presentTransitionDuration(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController, using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    override func presentAnimateTransition(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController, using transitionContext: UIViewControllerContextTransitioning) {
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
    
    override func dismissTransitionDuration(forDismissed dismissed: UIViewController, using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    override func dismissAnimateTransition(forDismissed dismissed: UIViewController, using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
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
            toVC.view.frame = self.window.bounds
        }, completion: { _ in
            if transitionContext.transitionWasCancelled {
                transitionContext.completeTransition(false)
            } else {
                self.backgroundView.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        })
    }
    
    private lazy var interactor: UIPercentDrivenInteractiveTransition = {
        let percentDrivenInteractiveTransition = UIPercentDrivenInteractiveTransition()
        return percentDrivenInteractiveTransition
    }()
    
    override func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }

    
    override func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return hasStarted ? interactor : nil
    }

    override func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return nil
    }
    
    var hasStarted = false
    
    @objc
    func handleGesture(_ sender: UIPanGestureRecognizer) {
        guard let view = presentedViewController?.view, let vc = presentedViewController else { return }
        let percentThreshold:CGFloat = 0.3
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        switch sender.state {
        case .began:
            hasStarted = true
            vc.dismiss(animated: true, completion: nil)
        case .changed:
            interactor.update(progress)
        case .cancelled:
            hasStarted = false
            interactor.cancel()
        case .ended:
            hasStarted = false
            progress > percentThreshold ? interactor.finish() : interactor.cancel()
        default:
            break
        }
    }
}
