//
//  ViewController.swift
//  PresentationController
//
//  Created by Anish Munirathinam on 15/10/19.
//  Copyright © 2019 Presentation Controller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let topSegue = "Top"
    fileprivate let rightSegue = "Right"
    fileprivate let leftSegue = "Left"
    fileprivate let bottomSegue = "Bottom"
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PresentedViewController {
            if segue.identifier == topSegue {
                slideInTransitioningDelegate.direction = .top
            } else if segue.identifier == bottomSegue {
                slideInTransitioningDelegate.direction = .bottom
            } else if segue.identifier == leftSegue {
                slideInTransitioningDelegate.direction = .left
            } else if segue.identifier == rightSegue {
                slideInTransitioningDelegate.direction = .right
            }
            controller.transitioningDelegate = slideInTransitioningDelegate
            controller.modalPresentationStyle = .custom
        }
    }

}

