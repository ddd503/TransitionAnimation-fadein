//
//  SecondViewController.swift
//  test_UIViewControllerTransitioningDelegate_fadeIn
//
//  Created by kawaharadai on 2018/05/04.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        /* その他のアニメーション
         kCATransitionMoveIn
         kCATransitionPush
         kCATransitionReveal
         kCATransitionFade
         */
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.popViewController(animated: false)
    }

}
