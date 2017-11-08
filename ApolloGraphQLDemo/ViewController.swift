//
//  ViewController.swift
//  ApolloGraphClientDemo
//
//  Created by Danh Dang on 11/1/17.
//  Copyright © 2017 Danh Dang. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var products = [GetProductQuery.Data.ProductList.Product]()
    var productWatcher: GraphQLQueryWatcher<GetProductQuery>?
    let cellIdentifier = "CollectionCellReuseIdentifier"
    
    fileprivate let spacing: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
        }
        loadMockData()
    }
    
    func loadMockData() {
        let allProducts = GetProductQuery()
        productWatcher = apollo.watch(query: allProducts) { [weak self] result, error in
            guard error == nil,
                let products = result?.data?.productList?.products else {
                    print(error?.localizedDescription ?? "Error loading products")
                    return
            }
            self?.products = products.flatMap { $0 }
            self?.collectionView.reloadData()
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        let product = products[indexPath.item]
        cell.updateView(with: product)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size =  Int((collectionView.frame.width - spacing*2) / 2)
        return CGSize(width: size, height: size)
    }
}

extension ViewController: UICollectionViewDelegate {
    
}



