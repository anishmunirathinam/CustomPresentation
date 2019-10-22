//
//  SlideInPresentationAnimator.swift
//  PresentationController
//
//  Created by Anish Munirathinam on 22/10/19.
//  Copyright © 2019 Presentation Controller. All rights reserved.
//

import UIKit

class SlideInPresentationAnimator: NSObject {
    let direction: PresentationDirection
    let isPresentation: Bool
    
    init(direction: PresentationDirection, isPresented: Bool) {
        self.direction = direction
        self.isPresentation = isPresented
        super.init()
    }
}

extension SlideInPresentationAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key: UITransitionContextViewControllerKey = isPresentation ? .to : .from

        guard let controller = transitionContext.viewController(forKey: key)
          else { return }
        
        if isPresentation {
          transitionContext.containerView.addSubview(controller.view)
        }
        
        let presentedFrame = transitionContext.finalFrame(for: controller)
        var dismissedFrame = presentedFrame
        switch direction {
        case .left:
          dismissedFrame.origin.x = -presentedFrame.width
        case .right:
          dismissedFrame.origin.x = transitionContext.containerView.frame.size.width
        case .top:
          dismissedFrame.origin.y = -presentedFrame.height
        case .bottom:
          dismissedFrame.origin.y = transitionContext.containerView.frame.size.height
        }
          
        let initialFrame = isPresentation ? dismissedFrame : presentedFrame
        let finalFrame = isPresentation ? presentedFrame : dismissedFrame
          
        let animationDuration = transitionDuration(using: transitionContext)
        controller.view.frame = initialFrame
        UIView.animate(
          withDuration: animationDuration,
          animations: {
            controller.view.frame = finalFrame
        }, completion: { finished in
          if !self.isPresentation {
            controller.view.removeFromSuperview()
          }
          transitionContext.completeTransition(finished)
        })
    }
}
