//
//  ZProduct.swift
//  ApolloGraphQLDemo
//
//  Created by Danh Dang on 11/9/17.
//  Copyright © 2017 Danh Dang. All rights reserved.
//

import IGListKit

class ZProduct {
    let data: GetProductQuery.Data.ProductList.Product
    init(_ product: GetProductQuery.Data.ProductList.Product) {
        data = product
    }
    
    convenience init() {
        let product = GetProductQuery.Data.ProductList.Product(id: "", name: "", mainImageUrl: "")
        self.init(product)
    }
}

extension ZProduct: Equatable {
    static func ==(lhs: ZProduct, rhs: ZProduct) -> Bool {
        let lhsData = lhs.data
        let rhsData = rhs.data
        return lhsData.id == rhsData.id && lhsData.name == rhsData.name && lhsData.mainImageUrl == rhsData.mainImageUrl
    }
}

class ZProductList {
    var products = [ZProduct]()
    init(_ products: [ZProduct]) {
        self.products = products
    }
}

extension ZProductList: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return "productList" as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let productList = object as? ZProductList else { return false }
        return products == productList.products
    }
}

