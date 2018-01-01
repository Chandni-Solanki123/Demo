//
//  ViewController.swift
//  Demo
//
//  Created by Chandni Solanki on 22/09/16.
//  Copyright © 2016 ChandniSolanki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customPresentAnimation = CustomAnimationPresent(true)
    let customDismissAnimation = CustomAnimationPresent(false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showViewController" {
            let toViewController = segue.destination as! FirstViewController
            toViewController.transitioningDelegate = self
        }
    }
}
extension ViewController : UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return customPresentAnimation
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return customDismissAnimation
    }
}

