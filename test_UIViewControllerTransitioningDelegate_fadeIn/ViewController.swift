//
//  ViewController.swift
//  test_UIViewControllerTransitioningDelegate_fadeIn
//
//  Created by kawaharadai on 2018/05/04.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let fadeInAnimator = FadeInAnimator()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // 標準の戻るボタンを消す（ナビバー部分は共通のため）
        self.navigationItem.hidesBackButton = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 画面遷移するときにカスタムのアニメーションを使うか問い合わせる
        guard let controller = segue.destination as? SecondViewController else {
            return
        }
        controller.transitioningDelegate = self
    }
    
    // MARK: - Action
    @IBAction func buttonAction(_ sender: Any) {
        
        guard let storyboard = self.storyboard else {
            print("遷移先のインスタンス化に失敗")
            return
        }
        
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        
        // 遷移にアニメーションを追加（許可自体はデリゲートで）
        let transition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(secondVC, animated: false)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController,
                                                   presentingController presenting: UIViewController,
                                                   sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // アニメータクラスを返すと、画面遷移するときにアニメータクラスを使う。nilだとデフォルトの画面遷移アニメーションとなる
        return fadeInAnimator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // アニメータクラスを返すと、遷移後に画面を閉じたときにアニメータクラスを使う。nilだとデフォルトの画面遷移アニメーションとなる
        return nil
    }
}
