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
    
    func updateView(with product: GetProductQuery.Data.Product) {
        imageView.kf.setImage(with: URL(string: product.mainImageUrl))
        nameLabel.text = product.name
    }
}
