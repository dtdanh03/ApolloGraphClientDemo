//
//  ProductCollectionViewCell.swift
//  ApolloGraphClientDemo
//
//  Created by Danh Dang on 11/6/17.
//  Copyright © 2017 Danh Dang. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateView(with product: ZProduct) {
        imageView.kf.setImage(with: URL(string: product.data.mainImageUrl))
        nameLabel.text = product.data.name
    }
}
