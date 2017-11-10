//
//  ProductSectionController.swift
//  ApolloGraphQLDemo
//
//  Created by Danh Dang on 11/9/17.
//  Copyright © 2017 Danh Dang. All rights reserved.
//

import IGListKit

class ProductSectionController: ListSectionController {
    var productList: ZProductList?
    fileprivate let cellIdentifier = "CollectionCellReuseIdentifier"
    
    override func numberOfItems() -> Int {
        return productList?.products.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let size =  Int((collectionContext!.containerSize.width) / 2)
        return CGSize(width: size, height: size)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext!.dequeueReusableCellFromStoryboard(withIdentifier: cellIdentifier, for: self, at: index) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        let product = productList?.products[index]
        cell.updateView(with: product ?? ZProduct())
        return cell
    }
    
    override func didUpdate(to object: Any) {
        productList = object as? ZProductList
    }
}

