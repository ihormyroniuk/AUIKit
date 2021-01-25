//
//  PresentAnimationTransitioningDelegate.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 25.01.2021.
//

import UIKit

class PresentAnimationTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    private let animator = BookingSelectTimeViewControllerAnimator()
    private let interactor = BookingSelectTimeSlotInteractor()
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private weak var vc: UIViewController?
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
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
