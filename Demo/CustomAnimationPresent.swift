//
//  CustomAnimationPresent.swift
//  Demo
//
//  Created by Chandni Solanki on 13/01/17.
//  Copyright © 2017 ChandniSolanki. All rights reserved.
//

import UIKit

class CustomAnimationPresent: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresent = true
    init(_ isPresent : Bool){
      self.isPresent = isPresent
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        
        return 1.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
       
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let toVCFinalFrame = transitionContext.finalFrame(for: toViewController)
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        let fromVCFinalFrame : CGRect?
        
        if isPresent {
            fromVCFinalFrame = CGRect(x: 0, y: -bounds.size.height, width: bounds.size.width, height: bounds.size.height)
            
            toViewController.view.frame = toVCFinalFrame.offsetBy(dx: 0, dy: bounds.size.height)
            containerView.addSubview(toViewController.view)
        }
        else{ // dismiss
            fromVCFinalFrame = CGRect(x: 0, y: bounds.size.height, width: bounds.size.width, height: bounds.size.height)
            
            toViewController.view.frame = toVCFinalFrame.offsetBy(dx: 0, dy: -bounds.size.height)
            containerView.addSubview(toViewController.view)
        }
        
        //call animation
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, options: .curveLinear, animations: {
            fromViewController.view.alpha = 0.5
            toViewController.view.frame = toVCFinalFrame
            fromViewController.view.frame = fromVCFinalFrame!
        }) { (finished) in
            transitionContext.completeTransition(true)
            fromViewController.view.alpha = 1.0
        }
    }
}
