//
//  UIViewControllerExtension.swift
//  UICollectionViewCompositionalLayoutExample
//
//  Created by 酒井文也 on 2020/01/05.
//  Copyright © 2020 酒井文也. All rights reserved.
//

import Foundation
import UIKit

// UIViewControllerの拡張
extension UIViewController {

    // この画面のナビゲーションバーを設定するメソッド
    public func setupNavigationBarTitle(_ title: String) {

        // NavigationControllerのデザイン調整を行う
        var attributes: [NSAttributedString.Key : Any] = [:]
        attributes[NSAttributedString.Key.font] = UIFont(name: "HiraKakuProN-W6", size: 14.0)
        attributes[NSAttributedString.Key.foregroundColor] = UIColor.white

        // NavigationBarをタイトル配色を決定する
        guard let nav = self.navigationController else {
            return
        }
        nav.navigationBar.titleTextAttributes = attributes

        // タイトルを入れる
        self.navigationItem.title = title
    }
}
