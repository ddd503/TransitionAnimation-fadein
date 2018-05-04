//
//  FadeInAnimator.swift
//  test_UIViewControllerTransitioningDelegate_fadeIn
//
//  Created by kawaharadai on 2018/05/04.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class FadeInAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // 画面遷移にかかる時間を返す
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    // 画面遷移のアニメーション内容を書く
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // アニメーションが実行されるコンテナビューの取得
        let containerView = transitionContext.containerView
        
        // 遷移先画面の取得
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        toView.alpha = 0.0
        
        // 遷移先画面をコンテナビューに追加
        containerView.addSubview(toView)
        
        // 遷移先画面のalpha値をアニメーション
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { () -> Void in
            
            // alpha値を0.0から1.0に変化させることでフェードインしているように見せる
            toView.alpha = 1.0
            
        }, completion: { _ in
            // アニメーションが終了したことを通知する
            transitionContext.completeTransition(true)
        })
    }
}
