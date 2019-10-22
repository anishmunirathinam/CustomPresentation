//
//  SlideInPresentationManager.swift
//  PresentationController
//
//  Created by Anish Munirathinam on 21/10/19.
//  Copyright © 2019 Presentation Controller. All rights reserved.
//

import UIKit

enum PresentationDirection {
    case top, left, bottom, right
}

class SlideInPresentationManager: NSObject {
    var direction: PresentationDirection = .left
}

extension SlideInPresentationManager: UIViewControllerTransitioningDelegate {
    func presentationController(
      forPresented presented: UIViewController,
      presenting: UIViewController?,
      source: UIViewController
    ) -> UIPresentationController? {
      let presentationController = SlideInPresentationController(
        presentedViewController: presented,
        presentingViewController: presenting,
        direction: direction
      )
      return presentationController
    }
    
    func animationController(
      forPresented presented: UIViewController,
      presenting: UIViewController,
      source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresented: true)
    }

    func animationController(
      forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresented: false)
    }
}
