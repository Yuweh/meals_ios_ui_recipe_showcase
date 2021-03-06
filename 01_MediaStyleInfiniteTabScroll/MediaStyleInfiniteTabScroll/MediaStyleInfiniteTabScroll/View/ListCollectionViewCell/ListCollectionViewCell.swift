//
//  ListCollectionViewCell.swift
//  MediaStyleInfiniteTabScroll
//
//  Created by 酒井文也 on 2019/10/31.
//  Copyright © 2019 酒井文也. All rights reserved.
//

import UIKit

final class ListCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    // 各々のセル間につけるマージンの値
    static let cellMargin: CGFloat = 12.0

    // UIImageViewに付与するグラデーション
    private var gradient: CAGradientLayer = CAGradientLayer()

    // MARK: - @IBOutlets

    @IBOutlet weak private var thumbnailImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var catchcopyLabel: UILabel!
    @IBOutlet weak private var categoryLabel: UILabel!

    // MARK: - Override

    override func prepareForReuse() {
        super.prepareForReuse()

        gradient.removeFromSuperlayer()
    }

    // MARK: - Static Function

    static func getCellSize() -> CGSize {

        // 縦方向の隙間の個数・文字表示部分の高さ・画像の縦横比
        let numberOfMargin: CGFloat = 3
        let descriptionHeight: CGFloat = 69.0
        let foodImageAspectRatio: CGFloat = 0.75

        // セルのサイズを上記の値を利用して算出する
        let cellWidth = (UIScreen.main.bounds.width - cellMargin * numberOfMargin) / 2
        let cellHeight = cellWidth * foodImageAspectRatio + descriptionHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }

    // MARK: - Function

    func setCellData(_ article: ArticleEntity) {

        thumbnailImageView.image = article.imageFile
        titleLabel.text = article.title
        catchcopyLabel.text = article.catchcopy
        categoryLabel.text = article.category
    }

    func setCellDecoration() {

        // UICollectionViewのcontentViewプロパティには罫線と角丸に関する設定を行う
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.systemGray6.cgColor

        // UICollectionViewのおおもとの部分にはドロップシャドウに関する設定を行う
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.systemGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.75, height: 1.75)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.28

        // ドロップシャドウの形状をcontentViewに付与した角丸を考慮するようにする
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}
