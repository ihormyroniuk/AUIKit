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
        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        transitionContext.containerView.insertSubview(backgroundView, aboveSubview: fromViewController.view)
        backgroundView.frame = window.bounds
        backgroundView.alpha = 0
        transitionContext.containerView.insertSubview(toViewController.view, aboveSubview: backgroundView)
        let toViewControllerInitialFrame = CGRect(x: 0, y: window.bounds.height, width: window.bounds.width, height: window.bounds.height)
        let toViewControllerViewSizeThatFits = toViewController.view.sizeThatFits(window.bounds.size)
        toViewController.view.frame = toViewControllerInitialFrame
        let toViewControllerViewOrigin = CGPoint(x: 0, y: window.bounds.height - toViewControllerViewSizeThatFits.height)
        let toViewControllerFinalFrame = CGRect(origin: toViewControllerViewOrigin, size: toViewControllerViewSizeThatFits)
        UIView.animate(withDuration: transitionDuration, animations: { [weak self] in
            guard let self = self else { return }
            toViewController.view.frame = toViewControllerFinalFrame
            self.backgroundView.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    override func dismissTransitionDuration(forDismissed dismissed: UIViewController, using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    override func dismissAnimateTransition(forDismissed dismissed: UIViewController, using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        let fromViewControllerFinalFrame = CGRect(x: 0, y: window.bounds.height, width: window.bounds.width, height: window.bounds.height)
        UIView.animate(withDuration: transitionDuration, animations: {
            fromViewController.view.frame = fromViewControllerFinalFrame
            self.backgroundView.alpha = 0
        }, completion: { _ in
            if transitionContext.transitionWasCancelled {
                transitionContext.completeTransition(false)
            } else {
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
        print(progress)
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
