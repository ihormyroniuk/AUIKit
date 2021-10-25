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
    private let backgroundViewTapGestureRecognizer = UITapGestureRecognizer()
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureRecognizerBeganLocation: CGPoint?
    private weak var presentedViewController: UIViewController?

    init(window: UIWindow) {
        self.window = window
        super.init()
        backgroundView.addGestureRecognizer(backgroundViewTapGestureRecognizer)
        backgroundViewTapGestureRecognizer.addTarget(self, action: #selector(tapAction))
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    override func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentedViewController = presented
        presentedViewController?.view.addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.addTarget(self, action: #selector(panGestureRecognizerAction))
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
        let fromViewControllerFinalFrame = CGRect(x: 0, y: window.bounds.height, width: fromViewController.view.bounds.width, height: fromViewController.view.bounds.height)
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
        return panGestureRecognizerBeganLocation != nil ? interactor : nil
    }

    override func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return nil
    }
    
    // MARK: Events
    
    @objc func tapAction() {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func panGestureRecognizerAction(_ panGestureRecognizer: UIPanGestureRecognizer) {
        guard let presentedViewController = presentedViewController, let presentedViewControllerView = presentedViewController.view else { return }
        switch panGestureRecognizer.state {
        case .began:
            panGestureRecognizerBeganLocation = panGestureRecognizer.location(in: window)
            presentedViewController.dismiss(animated: true, completion: nil)
        case .changed:
            guard let panGestureRecognizerBeganLocation = panGestureRecognizerBeganLocation else { return }
            let panGestureRecognizerLocation = panGestureRecognizer.location(in: window)
            let progress = (panGestureRecognizerLocation.y - panGestureRecognizerBeganLocation.y) / presentedViewControllerView.bounds.height
            interactor.update(progress)
        case .cancelled:
            panGestureRecognizerBeganLocation = nil
            interactor.cancel()
        case .ended:
            guard let panGestureRecognizerBeganLocation = panGestureRecognizerBeganLocation else { return }
            let panGestureRecognizerLocation = panGestureRecognizer.location(in: window)
            let progress = (panGestureRecognizerLocation.y - panGestureRecognizerBeganLocation.y) / presentedViewControllerView.bounds.height
            progress > 0.3 ? interactor.finish() : interactor.cancel()
            self.panGestureRecognizerBeganLocation = nil
        default:
            interactor.cancel()
            self.panGestureRecognizerBeganLocation = nil
            break
        }
    }
}
