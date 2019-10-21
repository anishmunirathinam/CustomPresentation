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
}
